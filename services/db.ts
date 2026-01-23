export const exportCsv = (data: any[]) => {
    return data.map((h: any) =>
        `${h.id},"${h.timestamp}",${h.lat},${h.lng},${h.intensity},"${h.confidence}",${h.source},"${h.location_name || ''}"`
    ).join('\n');
};
