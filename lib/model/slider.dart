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
  sliderModel.setTitle("Pandemi Covid");
  sliderModel.setDesc(
      "Disiplinlah dalam menerapkan protokol kesehatan agar tetap menjadi kebiasaan dalam keseharian");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.setImagePath("assets/child.png");
  sliderModel.setTitle("Olahraga");
  sliderModel.setDesc(
      "Mereka yang tidak punya waktu untuk berolahraga, cepat atau lambat harus meluangkan waktu untuk merawat penyakitnya");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.setImagePath("assets/onlen.jpg");
  sliderModel.setTitle("Belajar & Berdoa");
  sliderModel.setDesc(
      "Berdoa saja tidak cukup, belajar dengan baik adalah bukti Doa anda serius. Belajar adalah ibadah.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
