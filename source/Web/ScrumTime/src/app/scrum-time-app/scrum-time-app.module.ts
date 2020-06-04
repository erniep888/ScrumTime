import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { StoreModule } from '@ngrx/store';
import { EffectsModule } from '@ngrx/effects';
import { StoreRouterConnectingModule, routerReducer } from '@ngrx/router-store';
import { StoreDevtoolsModule} from '@ngrx/store-devtools';

import { ScrumTimeAppRoutingModule } from './scrum-time-app-routing.module';
import { ScrumTimeHomeComponent } from './components/scrum-time-home/scrum-time-home.component';
import { MainNavigationComponent } from './components/main-navigation/main-navigation.component';
import { errorMessageReducer } from './error-message.reducer';

import {MatMenuModule} from '@angular/material/menu';
import { MatSliderModule } from '@angular/material/slider';
import {MatToolbarModule} from '@angular/material/toolbar';


@NgModule({
  declarations: [ScrumTimeHomeComponent, MainNavigationComponent],
  imports: [
    CommonModule, 
    MatMenuModule,
    MatSliderModule,
    MatToolbarModule,  
    ScrumTimeAppRoutingModule,
    StoreModule.forRoot({
      router: routerReducer,
      errorMessage: errorMessageReducer,
    }),
    EffectsModule.forRoot([]),
    StoreRouterConnectingModule.forRoot(),
    StoreDevtoolsModule.instrument(),
  ]
})
export class ScrumTimeAppModule { }
