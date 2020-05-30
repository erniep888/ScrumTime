import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { WorkItem } from '../models/work-item';
import { ScrumTimeCommonModule } from '../scrum-time-common.module';

@Injectable({
  providedIn: ScrumTimeCommonModule
})
export class WorkItemService {

  _baseUrl = 'http://localhost:3000/workItems';

  constructor(private httpClient: HttpClient) { }

  private getCollectionUrl() {
    return this._baseUrl;
  }

  private getElementUrl(elementId: any) {
    return this._baseUrl + '/' + encodeURIComponent(String(elementId));
  }

  all() {
    return this.httpClient.get<WorkItem[]>(this.getCollectionUrl());
  }

  one(workItemId: number) {
    return this.httpClient.get<WorkItem>(this.getElementUrl(workItemId));
  }

  append(workItem: WorkItem) {
    return this.httpClient.post<WorkItem>(this.getCollectionUrl(), workItem);
  }

  replace(workItem: WorkItem) {
    return this.httpClient.put<WorkItem>(this.getElementUrl(workItem.id), workItem);
  }

  delete(workItemId: number) {
    return this.httpClient.delete<WorkItem>(this.getElementUrl(workItemId));
  }
}
