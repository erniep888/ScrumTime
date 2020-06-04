import { WorkItemType } from './work-item-type';

export class WorkItem {
  id: number;
  name: string;
  description: string;
  priority: number;
  points: number;
  hoursEstimate: number;
  stepsToReproduce: string;
  productId: number;
  workItemParentId: number;
  workItemTypeId: number;
  workItemStatusId: number;

  constructor(){    
  }
}