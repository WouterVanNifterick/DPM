{***************************************************************************}
{                                                                           }
{           Delphi Package Manager - DPM                                    }
{                                                                           }
{           Copyright � 2019 Vincent Parrett and contributors               }
{                                                                           }
{           vincent@finalbuilder.com                                        }
{           https://www.finalbuilder.com                                    }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{***************************************************************************}

unit DPM.IDE.ProjectMenu;

interface

uses
  System.Classes,
  VCL.Menus,
  ToolsAPI;

type
  TDPMProjectMenuNotifier = class(TInterfacedObject, IOTAProjectMenuItemCreatorNotifier, IOTANotifier)
  private

  protected
    procedure AddMenu(const Project: IOTAProject; const IdentList: TStrings; const ProjectManagerMenuList: IInterfaceList; IsMultiSelect: Boolean);
    procedure AfterSave;
    procedure BeforeSave;
    procedure Destroyed;
    procedure Modified;

    procedure OnManagePackages(Sender : TObject);

  public
    constructor Create;
  end;

  TDPMProjectMenu = class(TInterfacedObject, IOTANotifier, IOTALocalMenu, IOTAProjectManagerMenu)
  private
    FOnClick : TNotifyEvent;
    FProject : IOTAProject;

  protected
    //IOTANotifier
    procedure AfterSave;
    procedure BeforeSave;
    procedure Destroyed;
    procedure Modified;

    //IOTALocalMenu
    function GetCaption: string;
    function GetChecked: Boolean;
    function GetEnabled: Boolean;
    function GetHelpContext: Integer;
    function GetName: string;
    function GetParent: string;
    function GetPosition: Integer;
    function GetVerb: string;
    procedure SetCaption(const Value: string);
    procedure SetChecked(Value: Boolean);
    procedure SetEnabled(Value: Boolean);
    procedure SetHelpContext(Value: Integer);
    procedure SetName(const Value: string);
    procedure SetParent(const Value: string);
    procedure SetPosition(Value: Integer);
    procedure SetVerb(const Value: string);
    procedure Execute(const MenuContextList: IInterfaceList);
    function GetIsMultiSelectable: Boolean;
    function PostExecute(const MenuContextList: IInterfaceList): Boolean;
    function PreExecute(const MenuContextList: IInterfaceList): Boolean;
    procedure SetIsMultiSelectable(Value: Boolean);
  public
    constructor Create(const handler : TNotifyEvent; const project : IOTAProject);

  end;



implementation

uses
  Vcl.Dialogs,
  DPM.IDE.Constants;


{ TDPMProjectMenu }

procedure TDPMProjectMenuNotifier.AddMenu(const Project: IOTAProject; const IdentList: TStrings; const ProjectManagerMenuList: IInterfaceList; IsMultiSelect: Boolean);
var
  menu: IOTAProjectManagerMenu;
begin
  if Assigned(Project) and ((IdentList.IndexOf(sProjectContainer) <> -1) or (IdentList.IndexOf(sProjectGroupContainer) <> -1)) then
  begin
    menu := TDPMProjectMenu.Create(Self.OnManagePackages, Project);
    ProjectManagerMenuList.Add(menu);
  end;
end;

procedure TDPMProjectMenuNotifier.AfterSave;
begin

end;

procedure TDPMProjectMenuNotifier.BeforeSave;
begin

end;

constructor TDPMProjectMenuNotifier.Create;
begin

end;

procedure TDPMProjectMenuNotifier.Destroyed;
begin

end;

procedure TDPMProjectMenuNotifier.Modified;
begin

end;

procedure TDPMProjectMenuNotifier.OnManagePackages(Sender: TObject);
begin

end;

{ TDPMProjectMenu }

procedure TDPMProjectMenu.AfterSave;
begin

end;

procedure TDPMProjectMenu.BeforeSave;
begin

end;

constructor TDPMProjectMenu.Create(const handler : TNotifyEvent; const project : IOTAProject);
begin
  FOnClick := handler;
  FProject := project;
end;

procedure TDPMProjectMenu.Destroyed;
begin

end;

procedure TDPMProjectMenu.Execute(const MenuContextList: IInterfaceList);
begin
  if FProject <> nil then
  begin
    ShowMessage('Manage DPM Packages for : ' + FProject.FileName);
  end;
end;

function TDPMProjectMenu.GetCaption: string;
begin
  result := sWizardProjectMenuCaption;
end;

function TDPMProjectMenu.GetChecked: Boolean;
begin
  result := false;
end;

function TDPMProjectMenu.GetEnabled: Boolean;
begin
  result := true;
end;

function TDPMProjectMenu.GetHelpContext: Integer;
begin
  result := -1;
end;

function TDPMProjectMenu.GetIsMultiSelectable: Boolean;
begin
  result := true;
end;

function TDPMProjectMenu.GetName: string;
begin
  result := 'ManageDPM';
end;

function TDPMProjectMenu.GetParent: string;
begin
  result := '';
end;

function TDPMProjectMenu.GetPosition: Integer;
begin
  result := pmmpUserBuild;
end;

function TDPMProjectMenu.GetVerb: string;
begin
  result := 'ManageDPM';
end;

procedure TDPMProjectMenu.Modified;
begin

end;

function TDPMProjectMenu.PostExecute(const MenuContextList: IInterfaceList): Boolean;
begin
  Result := True;
end;

function TDPMProjectMenu.PreExecute(const MenuContextList: IInterfaceList): Boolean;
begin
  Result := True;
end;

procedure TDPMProjectMenu.SetCaption(const Value: string);
begin

end;

procedure TDPMProjectMenu.SetChecked(Value: Boolean);
begin

end;

procedure TDPMProjectMenu.SetEnabled(Value: Boolean);
begin

end;

procedure TDPMProjectMenu.SetHelpContext(Value: Integer);
begin

end;

procedure TDPMProjectMenu.SetIsMultiSelectable(Value: Boolean);
begin

end;

procedure TDPMProjectMenu.SetName(const Value: string);
begin

end;

procedure TDPMProjectMenu.SetParent(const Value: string);
begin

end;

procedure TDPMProjectMenu.SetPosition(Value: Integer);
begin

end;

procedure TDPMProjectMenu.SetVerb(const Value: string);
begin

end;

end.