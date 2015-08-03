/**
********************************************************************************
ContentBox - A Modular Content Platform
Copyright 2012 by Luis Majano and Ortus Solutions, Corp
www.ortussolutions.com
********************************************************************************
Apache License, Version 2.0

Copyright Since [2012] [Luis Majano and Ortus Solutions,Corp]

Licensed under the Apache License, Version 2.0 (the "License" );
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
********************************************************************************
* A Media-based Menu Item
*/
component persistent="true" entityName="cbMediaMenuItem" table="cb_menuItem" extends="contentbox.models.menu.item.BaseMenuItem" discriminatorValue="Media" {
    property name="mediaPath" notnull="false" ormtype="string" default="";
    property name="target" notnull="false" ormtype="string" default="";
    property name="urlClass" notnull="false" ormtype="string" default="";
    // DI
    property name="provider" persistent="false" inject="contentbox.models.menu.providers.MediaProvider";

    /**
     * Get a flat representation of this menu item
     */
    public struct function getMemento(){
        var result = super.getMemento();
        // add our subclasses's properties
        result[ "mediaPath" ] = getMediaPath();
        result[ "urlClass" ] = getURLClass();
        result[ "target" ] = getTarget();
        return result;
    }
}