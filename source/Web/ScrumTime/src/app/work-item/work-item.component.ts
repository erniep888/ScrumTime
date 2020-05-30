import { Component, OnInit } from '@angular/core';
import { WorkItemService } from '../scrum-time-common/services/work-item.service';
import { WorkItem } from '../scrum-time-common/models/work-item';

@Component({
  selector: 'app-work-item',
  templateUrl: './work-item.component.html',
  styleUrls: ['./work-item.component.scss'],
  providers: [WorkItemService]
})
export class WorkItemComponent implements OnInit {

  currentWorkItem: WorkItem;

  constructor(private workItemService: WorkItemService) { }

  ngOnInit(): void {
    this.workItemService.one(1).subscribe((data: WorkItem) => this.currentWorkItem ={
      id : data.id,
      name : data.name,      
      description: data.description,
      hoursEstimate: data.hoursEstimate,
      points: data.points,
      priority: data.priority,
      stepsToReproduce: data.stepsToReproduce,
      productId: data.productId,
      workItemTypeId: data.workItemTypeId,
      workItemStatusId: data.workItemStatusId,
      workItemParentId: data.workItemParentId
    });
  }

}
