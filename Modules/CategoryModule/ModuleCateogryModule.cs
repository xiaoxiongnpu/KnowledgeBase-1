﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CategoryModule.ViewModels;
using CategoryModule.Views;
using KnolwdgeBase.Infrastructure;
using Microsoft.Practices.Unity;
using Prism.Modularity;
using Prism.Regions;

namespace CategoryModule
{
    public class ModuleCateogryModule: IModule
    {
        private readonly IRegionManager _regionManager;
        private readonly IUnityContainer _container;

        public ModuleCateogryModule(IUnityContainer container, IRegionManager regionManager)
        {
            this._container = container;
            this._regionManager = regionManager;
        }

        public void Initialize()
        {
            RegisterViewsAndServices();

            var vm = _container.Resolve<ICategoryViewModel>();
            _regionManager.Regions[RegionNames.ContentRegion].Add(vm.View);
        }

        protected void RegisterViewsAndServices()
        {
            _container.RegisterType<ICategoryViewModel, CategoryViewModel>();
            _container.RegisterType<ICategoryView, CategoryView>();
        }
    }
}
//private void DriversDataGrid_PreviewDeleteCommandHandler(object sender, ExecutedRoutedEventArgs e)
//{
//    if (e.Command == DataGrid.DeleteCommand)
//    {
//        if (!(MessageBox.Show("Are you sure you want to delete?", "Please confirm.", MessageBoxButton.YesNo) == MessageBoxResult.Yes))
//        {
//            // Cancel Delete.
//            e.Handled = true;
//        }
//    }
//}
//private void Drivers_CollectionChanged(object sender, NotifyCollectionChangedEventArgs e)
//{
//    // Only Delete
//    if (e.Action == NotifyCollectionChangedAction.Remove)
//    {
//        foreach (FormulaOneDriver driver in e.OldItems)
//        {
//            driver.Delete();
//        }
//    }
//}