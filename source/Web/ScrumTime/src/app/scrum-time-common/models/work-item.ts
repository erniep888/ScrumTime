import { WorkItemType } from './work-item-type';

export interface WorkItem {
  id: number;
  name: string;
  description: string;
  priority: number;
  points: number;
  hoursEstimate: number;
  stepsToReproduce: string;
  workItemTypeId: number;
  parentId: number;
}