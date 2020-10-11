import 'package:FlutterNews/models/category_model.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel> category =new List<CategoryModel>();

  CategoryModel categoryModel;

  categoryModel=new CategoryModel();
  categoryModel.categoryName="Business";
  categoryModel.imageUrl="https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);


  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1525869811964-53594bfcb4b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80";
  category.add(categoryModel);


  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1489533119213-66a5cd877091?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80";
  category.add(categoryModel);

   categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1535914254981-b5012eebbd15?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModel);


  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1052&q=80";
  category.add(categoryModel);


  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1049&q=80";
  category.add(categoryModel);


  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(categoryModel);

  return category;
}