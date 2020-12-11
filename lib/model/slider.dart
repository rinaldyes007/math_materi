class SliderModel {
  String imagePath;
  String title;
  String desc;

  SliderModel({this.imagePath, this.title, this.desc});

  void setImagePath(String getImagepath) {
    imagePath = getImagepath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imagePath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  sliderModel.setImagePath("assets/covid.jpg");
  sliderModel.setTitle("Covid");
  sliderModel.setDesc("sdsssssssdfsfsfsfsfsfsfsffsfsf");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.setImagePath("assets/child.png");
  sliderModel.setTitle("Covidsdsd");
  sliderModel.setDesc("sdsssssssdfsfsfsfsfsfsfsffsfsf");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.setImagePath("assets/onlen.jpg");
  sliderModel.setTitle("Covidsdaaaaaa");
  sliderModel.setDesc("sdsssssssdfsfsfsfsfsfsfsffsfsf");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
