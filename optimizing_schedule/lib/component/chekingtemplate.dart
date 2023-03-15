const List<String> day = ['월', '화', '수', '목', '금'];
const List<String> time = ['9', '10', '11', '12', '13', '14', '15', '16', '17'];

class Subject {
  String title = '';
  String score = '';
  List time = [];
}

Map essentailSubjectCheck = {
  '월': {
    '9': false,
    '10': false,
    '11': false,
    '12': false,
    '13': false,
    '14': false,
    '15': false,
    '16': false,
    '17': false,
  },
  '화': {
    '9': false,
    '10': false,
    '11': false,
    '12': false,
    '13': false,
    '14': false,
    '15': false,
    '16': false,
    '17': false,
  },
  '수': {
    '9': false,
    '10': false,
    '11': false,
    '12': false,
    '13': false,
    '14': false,
    '15': false,
    '16': false,
    '17': false,
  },
  '목': {
    '9': false,
    '10': false,
    '11': false,
    '12': false,
    '13': false,
    '14': false,
    '15': false,
    '16': false,
    '17': false,
  },
  '금': {
    '9': false,
    '10': false,
    '11': false,
    '12': false,
    '13': false,
    '14': false,
    '15': false,
    '16': false,
    '17': false,
  },
};

List<Subject> EssentialSubjectList = [];
List<Subject> WantToSubjectList = [];
List<Subject> CanSubjectList = [];

List week = [
  '',
  '월',
  '화',
  '수',
  '목',
  '금',
];

const time_template = {
  '월': 1,
  '화': 2,
  '수': 3,
  '목': 4,
  '금': 5,
};
