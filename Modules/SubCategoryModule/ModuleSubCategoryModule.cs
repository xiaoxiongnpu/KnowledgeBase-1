﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KnolwdgeBase.Infrastructure;
using Microsoft.Practices.Unity;
using Prism.Modularity;
using Prism.Regions;
using SubCategoryModule.ViewModels;
using SubCategoryModule.Views;

namespace SubCategoryModule
{
    public class ModuleSubCateogryModule : IModule
    {
        private readonly IRegionManager _regionManager;
        private readonly IUnityContainer _container;

        public ModuleSubCateogryModule(IUnityContainer container, IRegionManager regionManager)
        {
            this._container = container;
            this._regionManager = regionManager;
        }

        public void Initialize()
        {
            RegisterViewsAndServices();

            var vm = _container.Resolve<ISubCategoryViewModel>();
            _regionManager.Regions[RegionNames.ContentRegion].Add(vm.View);
        }

        protected void RegisterViewsAndServices()
        {
            _container.RegisterType<ISubCategoryViewModel, SubCategoryViewModel>();
            _container.RegisterType<ISubCategoryView, SubCategoryView>();
        }
    }
}
