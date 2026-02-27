# Plugin-Creator

</br>

![Compiler](https://github.com/user-attachments/assets/a916143d-3f1b-4e1f-b1e0-1067ef9e0401) ![10 Seattle](https://github.com/user-attachments/assets/c70b7f21-688a-4239-87c9-9a03a8ff25ab) ![10 1 Berlin](https://github.com/user-attachments/assets/bdcd48fc-9f09-4830-b82e-d38c20492362) ![10 2 Tokyo](https://github.com/user-attachments/assets/5bdb9f86-7f44-4f7e-aed2-dd08de170bd5) ![10 3 Rio](https://github.com/user-attachments/assets/e7d09817-54b6-4d71-a373-22ee179cd49c)  ![10 4 Sydney](https://github.com/user-attachments/assets/e75342ca-1e24-4a7e-8fe3-ce22f307d881) ![11 Alexandria](https://github.com/user-attachments/assets/64f150d0-286a-4edd-acab-9f77f92d68ad) ![12 Athens](https://github.com/user-attachments/assets/59700807-6abf-4e6d-9439-5dc70fc0ceca)  
![Components](https://github.com/user-attachments/assets/d6a7a7a4-f10e-4df1-9c4f-b4a1a8db7f0e) ![None](https://github.com/user-attachments/assets/30ebe930-c928-4aaf-a8e1-5f68ec1ff349)  
![Description](https://github.com/user-attachments/assets/dbf330e0-633c-4b31-a0ef-b1edb9ed5aa7) ![PluIn](https://github.com/user-attachments/assets/d2c46a57-b18c-4214-8695-9b79aec3e84a)  
![Last Update](https://github.com/user-attachments/assets/e1d05f21-2a01-4ecf-94f3-b7bdff4d44dd) ![022026](https://github.com/user-attachments/assets/90c88085-69f5-4332-b090-2de107ca7f86)  
![License](https://github.com/user-attachments/assets/ff71a38b-8813-4a79-8774-09a2f3893b48) ![Freeware](https://github.com/user-attachments/assets/1fea2bbf-b296-4152-badd-e1cdae115c43)  

</br>

In computing, a plug-in (also spelled plugin), add-in (also addin, add-on, or addon) or extension is a [software component](https://en.wikipedia.org/wiki/Software_component) that extends the functionality of an existing software system without requiring the system to be [re-built](https://en.wikipedia.org/wiki/Software_build). A plug-in feature is one way that a system can be customizable.

Plugins can be created by the same publisher as the main software. It’s also common to see third-party plugins developed by other companies or developers.

The word “extension” is also commonly used to refer to a plugin. Although given a different name, extensions work the same way as plugins, namely by adding functionality without altering the main program.

</br>

# Instructions:
* First, start the ```Creator Project``` to build the driver for the main program.
* The content of ```FormUnit.pas``` is the content that is started by the main program as a plugin.
* Press ```Ctrl+F9``` or select ```Project > Compile``` from the menu to generate the driver. If the project is executed, this error message will appear, which can be ignored.

</br>

![Error](https://github.com/user-attachments/assets/f4c13e75-56d8-40a9-8713-324c5a692a63)

</br>

* PlugIn initialization..

```pascal
procedure TForm2.FormCreate(Sender: TObject);
var
  pc: PChar;
resourcestring
  rsNoModuleName = 'Could not determine module name';
begin
  GetMem(pc, MAX_PATH);
  if Assigned(pc) then
  try
    ZeroMemory(pc, MAX_PATH);
    GetModuleFileName(hInstance, pc, MAX_PATH);
    Label2.Caption := ExtractFilename(string(pc));
  finally
    FreeMem(pc);
  end
  else
    Label1.Caption := rsNoModuleName;
end;

procedure FormShowModal(Parent: Pointer); stdcall;
begin
  Form2 := TForm2.Create(nil);
  if Assigned(Parent) then
    Form2.SetParent(Parent);
  Form2.ShowModal;
end;
```

* After the driver is built, the PlugInDemo project starts.
* Loading the plugin driver into the main program.

```pascal
procedure TForm1.FormCreate(Sender: TObject);
begin
  LoadPlugins();
end;

procedure TForm1.LoadPlugins;
var
  Path         : string;
  PluginFile   : string;
  sr           : TSearchRec;
  lib          : THandle;
  s            : string;
  NewItem      : TMenuItem;
  ItemCount    : Cardinal;
begin
  ItemCount := 0;
  // Specify the name for certain drivers
  Path := ExtractFilepath(ParamStr(0)) + PLUGIN_PATH + '\*.dll';
  if FindFirst(Path, faAnyFile, sr) = 0 then
  begin
    repeat
      PluginFile := ExtractFilepath(ParamStr(0)) + PLUGIN_PATH + '\' + sr.Name;
      Lib := LoadLibrary(PChar(PluginFile));
      if Lib <> 0 then
      begin
        // build menu item
        @MenuCaption := GetProcAddress(Lib, 'MenuCaption');
        SetLength(PluginArray, ItemCount + 1);
        @PluginArray[ItemCount] := GetProcAddress(Lib, 'LoadPlugin');
        if (Assigned(MenuCaption)) and (Assigned(PluginArray[ItemCount])) then
        begin
          NewItem := TMenuItem.Create(self);
          SetLength(s, 1024);
          SetLength(s, MenuCaption(PAnsiChar(s), 1024));
          NewItem.Caption := PChar(s);
          NewItem.Tag := ItemCount;
          NewItem.OnClick := MenuOnClick;
          mnuPlugins.Add(NewItem);
          Inc(ItemCount);
        end;
      end;
    until FindNext(sr) <> 0;
  end;
end;
```

</br>

# What are plugins used for?
Plugins are used to add extra features to a web program without changing the main program. They are used on a range of programs, from CMSs to browsers.

A plugin can help improve the user experience and make it easier for users to make certain changes. For example, WordPress plugins make it easier to interact with the CMS. Users can easily alter the code and functionality of their website by downloading a plugin instead of writing the code themselves.

A browser plugin, often called an extension, interacts with the browser. Some examples of browser plugins may be ad blockers that prevent you from seeing advertisements on websites, or overlays that provide you extra information.

Although plugins are still commonly used in computer programs and apps, their use in web browsers has reduced over the past few years. Plugins like Adobe Flash Player, which was once an important plugin for interactive elements like videos and games, have been replaced by HTML5, providing a superior user experience.

</br>

# Where are plugins used?
Content management systems
Most CMSs, including WordPress, Shopify, and Squarespace, offer users the possibility to work with plugins/extensions. Most CMSs also allow third parties to create plugins that alter a user’s website, which provides users with more choice and flexibility.

The features added to the CMS using plugins can range from an easy method for adding a contact form to a website to plugins for page speed optimization. WordPress is one of the most popular CMSs that offers plugins by third-party developers. WordPress plugins can be either paid or free and add extra functionality to the main WordPress platform.

### Browsers
Although not used as often today, many browsers still support the use of browser extensions. These plugins can add additional features like ad-blocking or data scraping. They can also add simple features like showing whether links on a page are dofollow or nofollow.

### Text editors
Many text editors use plugins to provide support for certain programming languages. These plugins can make writing code easier and provide clearer formatting for different programming languages.

### Editing software
Software for editing videos and images commonly comes with plugins to provide improved compatibility for certain file types.
