class events_model
{
  final int id;
  final String title;
  final int horse;
  final int min;
  final int value;
  
  const events_model({
    required this.id,
    required this.title,
    required this.horse,
    required this.min,
    required this.value,
  });

  Map<String,dynamic> toMap()
  {
    return {
      "id":id,
      "title":title,
      "horse":horse,
      "min":min,
      "value":value,
    };
  }


  @override
  String toString()
  {
    return "{id:$id,title:'$title',horse:'$horse',min:'$min',value:'$value'}";
  }


  factory events_model.from_json(Map<String,dynamic> json)
  {
    return events_model(id: json['id'],title: json['title'],horse: json['horse'],min: json['min'],value: json['value']);
  }


}