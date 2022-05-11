class FeedbackForm {
  String Roll_Number;
  String Name;
  String Place;
  String Skill;

  FeedbackForm(this.Roll_Number, this.Name, this.Place, this.Skill);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm("${json['Roll_Number']}", "${json['Name']}",
        "${json['Place']}", "${json['Skill']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
        'Roll_Number': Roll_Number,
        'Name': Name,
        'Place': Place,
        'Skill': Skill
      };
}