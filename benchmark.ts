import { exportCsv } from './services/db';

const generateData = (count: number) => {
    const data = [];
    for (let i = 0; i < count; i++) {
        data.push({
            id: i,
            timestamp: new Date().toISOString(),
            lat: Math.random() * 180 - 90,
            lng: Math.random() * 360 - 180,
            intensity: Math.random(),
            confidence: Math.random() > 0.5 ? "HIGH" : "LOW",
            source: "sensor_" + (i % 10),
            location_name: "Location " + i
        });
    }
    return data;
};

const exportCsvOld = (data: any[]) => {
    const csvRows: string[] = [];
    data.forEach((h: any) => {
        const row = [
            h.id,
            `"${h.timestamp}"`,
            h.lat,
            h.lng,
            h.intensity,
            `"${h.confidence}"`,
            h.source,
            `"${h.location_name || ''}"`
        ];
        csvRows.push(row.join(','));
    });

    return csvRows.join('\n');
};

const runBenchmark = () => {
    const COUNT = 100000;
    console.log(`Generating ${COUNT} records...`);
    const data = generateData(COUNT);

    // Warmup
    exportCsv(data.slice(0, 100));
    exportCsvOld(data.slice(0, 100));

    console.log("Running Baseline (Old)...");
    const startOld = process.hrtime();
    const resultOld = exportCsvOld(data);
    const endOld = process.hrtime(startOld);
    const timeOld = (endOld[0] * 1000 + endOld[1] / 1e6).toFixed(2);
    console.log(`Baseline Execution time: ${timeOld} ms`);

    console.log("Running Optimized (New)...");
    const startNew = process.hrtime();
    const resultNew = exportCsv(data);
    const endNew = process.hrtime(startNew);
    const timeNew = (endNew[0] * 1000 + endNew[1] / 1e6).toFixed(2);
    console.log(`Optimized Execution time: ${timeNew} ms`);

    // Verification
    if (resultOld !== resultNew) {
        console.error("Error: Outputs do not match!");
        console.log("Old length:", resultOld.length);
        console.log("New length:", resultNew.length);
        // Find first difference
        for(let i=0; i<resultOld.length; i++) {
            if (resultOld[i] !== resultNew[i]) {
                console.log(`Difference at index ${i}: Old '${resultOld[i]}' vs New '${resultNew[i]}'`);
                console.log(`Context Old: ${resultOld.substring(i-10, i+20)}`);
                console.log(`Context New: ${resultNew.substring(i-10, i+20)}`);
                break;
            }
        }
    } else {
        console.log("Verification Passed: Outputs are identical.");
    }
};

runBenchmark();
