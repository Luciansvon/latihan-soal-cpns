// UUID v4 generator using Math.random.
// Used for client-side IDs (sessions, answers) before they sync to Supabase
// (whose columns are UUID-typed). Collision probability is negligible at
// personal-use scale.
export function uuidv4(): string {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, (c) => {
    const r = (Math.random() * 16) | 0;
    const v = c === 'x' ? r : (r & 0x3) | 0x8;
    return v.toString(16);
  });
}
