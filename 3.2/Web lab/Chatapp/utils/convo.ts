// utils/convo.ts
export function convoIdFor(u1: string, u2: string) {
  return [u1, u2].sort().join('_');
}

export function emailToUsername(email?: string | null) {
  if (!email) return '';
  return String(email).split('@')[0];
}
