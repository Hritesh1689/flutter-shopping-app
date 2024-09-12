class NormalCardInfo{
  final String imgUrl;
  final List<String> info;
  final bool isFavourite;

  NormalCardInfo({required this.imgUrl, required this.info, required this.isFavourite});
  
   static NormalCardInfo empty(){
     return NormalCardInfo(imgUrl: "", info: [], isFavourite: false);
  }
}