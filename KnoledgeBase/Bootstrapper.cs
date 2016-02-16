﻿using System.Windows;
using KB.People;
using KB.Services;
using KB.StatusBar;
using KB.Toolbar;
using Microsoft.Practices.Unity;
using Prism.Modularity;
using Prism.Unity;

namespace KnoledgeBase
{
    public class Bootstrapper:UnityBootstrapper
    {
        protected override DependencyObject CreateShell()
        {
            return Container.Resolve<Shell>();
        }
        protected override void InitializeShell()
        {
            base.InitializeShell();

            App.Current.MainWindow = (Window) Shell;
            App.Current.MainWindow.Show();
        }

        protected override IModuleCatalog CreateModuleCatalog()
        {
            ModuleCatalog catalog = new ModuleCatalog();
            catalog.AddModule(typeof(ServicesModule));
            catalog.AddModule(typeof(ToolbarModule));
            catalog.AddModule(typeof (PeopleModule));
            catalog.AddModule(typeof(StatusBarModule));
            
            
            //catalog.AddModule(typeof(SubCatModule));            
            return catalog;
        }

        //protected override void ConfigureModuleCatalog()
        //{
        //    Type moduleAType = typeof (ModuleAModule);
        //    ModuleCatalog.AddModule(new ModuleInfo()
        //    {
        //        ModuleName = moduleAType.Name,
        //        ModuleType = moduleAType.AssemblyQualifiedName,
        //        InitializationMode = InitializationMode.WhenAvailable
        //    });

        //}
    }
}