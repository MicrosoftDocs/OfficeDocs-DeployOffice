---
title: "Azure Maps Creator Guide for Microsoft Places"
ms.author: mactra
author: MachelleTranMSFT
manager: jtremper
ms.date: 05/14/2024
audience: ITPro
ms.topic: conceptual
ms.service: o365-proplus-itpro
ms.collection: Tier3
ms.localizationpriority: medium
recommendations: true
description: "Guide to converting DWG floor plans to IMDF for indoor mapping in Places using the Azure Maps Creator tool."
---

# Azure Maps Creator Guide for Microsoft Places

This guide shows you how convert your DWG floor plans to IMDF for indoor mapping in Microsoft Places using the Azure Maps Creator tool. IMDF is currently the required file format for floorplans in Places.

You can choose any CAD software to open and prepare your facility drawing files. However, procedures in this guide is were created using Autodesk's AutoCAD software. Any commands referenced in this guide are meant to be executed using Autodesk's AutoCAD® software. For detailed information on creating indoor maps, see [Create indoor map with the onboarding tool](/azure/azure-maps/creator-onboarding-tool).

## Glossary of terms

This guide uses the following terms and definitions.

|Term  |Definition  |
|-----------|---------|
|Layer      |An AutoCAD DWG layer from the drawing file|
|Entity     |An AutoCAD DWG entity from the drawing file|
|Level      |An area of a building at a set elevation (for example, the floor of a building)|
|Feature    |An object that combines a geometry with more metadata information|

## File requirements

When preparing your building drawing files for conversion, make sure to follow these preliminary requirements and recommendations:  

- Building drawing files must be saved in DWG format, which is the native file format for Autodesk's AutoCAD software.  

- The Conversion service works with the AutoCAD DWG file format. AC1032 is the internal format version for the DWG files. It's a good idea to select AC1032 for the internal DWG file format version.

- A DWG file can only contain a single floor. A floor of a facility must be provided in its own separate DWG file. Therefore, if you have five floors in a facility, you must create five separate DWG files.

### Prepare the DWG files

This part of the guide shows you how to use CAD commands to ensure that your DWG files meet the requirements of the Conversion service.  

You can choose any CAD software to open and prepare your facility drawing files. However, this guide is created using Autodesk's AutoCAD software. Any commands referenced in this guide are meant to be executed using Autodesk's AutoCAD software.  

A single DWG file is required for each level of the building. All data of a single level must be contained in a single DWG file. Any external references (xrefs) must be bound to the parent drawing. For example, a building with three levels has three DWG files.

### DWG layer requirements

Each DWG layer must adhere to the following rules:

- A layer must exclusively contain features of a single class and category. For example, units of category room and wall can’t be on the same layer.

- A single class or category of features can be represented by multiple layers.

- Feature must be drawn as a closed geometry of the following entity types: POLYGON, POLYLINE (closed), CIRCLE, or ELLIPSE (closed).

- Feature text properties must be of entity type: TEXT or MTEXT.

- Feature text properties must not contain additional information. For example, one MTEXT can’t contain both the name and category of a Unit.

- TEXT and MTEXT justification point must fall within the bounds of the closed geometry.

- Feature properties must be on their own layer. For example, all Unit names must be on a separate layer and can’t be on the same layer as the unit category.

- Any DWG entity type that is not supported will be ignored.

