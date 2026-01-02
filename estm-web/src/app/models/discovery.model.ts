export type ItemType = 'Métier' | 'Formation';

export interface DiscoveryItem {
  id: string;
  type: ItemType;
  title: string;
  institution: string; // Ex: ESTM, Université de Yaoundé I, etc.
  domain: string; // Ex: Mines, Informatique, Santé
  description: string;
  location: string;
  requirements: string;
  fee?: string;
  tags: string[];
}
