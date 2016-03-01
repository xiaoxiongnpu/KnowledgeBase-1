﻿using System;
using System.Windows;
using System.Windows.Controls;
using CategoryModule.ViewModels;
using CategoryModule.Views;
using DomainClasses.Models;
using KnolwdgeBase.Infrastructure;
using SubCategoryModule.ViewModels;

namespace SubCategoryModule.Views
{
    /// <summary>
    /// Interaction logic for SubCategoryView.xaml
    /// </summary>
    public partial class SubCategoryView : UserControl, ISubCategoryView
    {
        SubCategoryViewModel _cvm = null;

        public SubCategoryView()
        {
            InitializeComponent();
        }

        public IViewModel ViewModel
        {
            get { return (IViewModel)DataContext; }
            set { DataContext = value; }
        }

        private void GridSubCategory_RowEditEnding(object sender, DataGridRowEditEndingEventArgs e)
        {
            bool ok = false;

            //var _emp = e.Row.Item as Employee;
            SubCategory cat = e.Row.DataContext as SubCategory;
            _cvm = (SubCategoryViewModel)ViewModel;
            cat.ModifiedDate = DateTime.Now;

            ok = _cvm.ManageSave(cat);

            if (ok)
            {
                MessageBox.Show(SubCategoryModule.Properties.Resources.SaveSuccess,
                    SubCategoryModule.Properties.Resources.SaveSubCategoryResult,
                    MessageBoxButton.OK,
                    MessageBoxImage.Information);
            }
            else
            {
                MessageBox.Show(SubCategoryModule.Properties.Resources.SaveSuccess,
                    SubCategoryModule.Properties.Resources.SaveSubCategoryResult,
                    MessageBoxButton.OK,
                    MessageBoxImage.Exclamation);
            }
        }
    }
}
