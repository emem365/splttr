class DummyData {
  static const usersOweYouList = [
    {
      'username': 'user1',
      'last_trans': '22-03-2020',
      'amount': 210,
      'avatar': 'blaster',
    },
    {
      'username': 'user2',
      'last_trans': '21-03-2020',
      'amount': 290,
      'avatar': 'mario',
    },
    {
      'username': 'user3',
      'last_trans': '20-03-2020',
      'amount': 190,
      'avatar': 'ghost',
    },
    {
      'username': 'user4',
      'last_trans': '10-03-2020',
      'amount': 28,
      'avatar': '',
    },
    {
      'username': 'user5',
      'last_trans': '02-03-2020',
      'amount': 873,
      'avatar': 'man',
    },
  ];
  static const youOweUsersList = [
    {
      'username': 'user6',
      'last_trans': '22-03-2020',
      'amount': -210,
      'avatar': 'einstein',
    },
    {
      'username': 'user7',
      'last_trans': '21-03-2020',
      'amount': -290,
      'avatar': 'man',
    },
    {
      'username': 'user8',
      'last_trans': '20-03-2020',
      'amount': -190,
      'avatar': 'woman',
    },
    {
      'username': 'user9',
      'last_trans': '10-03-2020',
      'amount': -28,
      'avatar': 'yoga',
    },
  ];
  static final splitsList = [
    {
      'tag': '200',
      'outing-name': 'Goa Trip',
      'friends': ['Akhilesh', 'Dharma', 'Jayesh', 'Mickey'],
      'date': DateTime(2022, 8, 14),
      'avatar': 'travel-bag',
    },
    {
      'tag': '201',
      'outing-name': 'New Year Celebration',
      'friends': ['Akhilesh', 'Jayesh', 'Ayush', 'Tarun'],
      'date': DateTime(2021, 12, 31),
      'avatar': 'living-room',
    },
    {
      'tag': '202',
      'outing-name': 'Blah blah',
      'friends': ['blah', 'badi', 'bu', 'blah'],
      'date': DateTime(2021, 8, 9),
      'avatar': 'school-bus',
    },
    {
      'tag': '203',
      'outing-name': 'Blah blah 2',
      'friends': ['blah', 'bu', 'blah'],
      'date': DateTime(2021, 9, 14),
      'avatar': 'sale',
    },
    {
      'tag': '204',
      'outing-name': 'Blah blah 3',
      'friends': ['bu', 'blah'],
      'date': DateTime(2021, 11, 2),
      'avatar': 'wallet',
    },
    {
      'tag': '205',
      'outing-name': 'Blah blah 4',
      'friends': ['blah', 'badi', 'bu', 'blah'],
      'date': DateTime(2021, 10, 11),
      'avatar': 'stove',
    },
    {
      'tag': '206',
      'outing-name': 'Blah blah 5',
      'friends': ['badi', 'bu', 'blah'],
      'date': DateTime(2021, 8, 9),
      'avatar': 'mario',
    },
    {
      'tag': '207',
      'outing-name': 'Blah blah 6',
      'friends': ['blah', 'badi', 'bu', 'blah'],
      'date': DateTime(2020, 8, 9),
      'avatar': 'golf-ball',
    },
    {
      'tag': '208',
      'outing-name': 'Blah blah 7',
      'friends': ['blah', 'bu', 'blah'],
      'date': DateTime(2021, 8, 9),
      'avatar': 'drink',
    },
    {
      'tag': '209',
      'outing-name': 'Blah blah infinity',
      'friends': ['blah', 'badi', 'bu', 'blah'],
      'date': DateTime(2020, 04, 22),
      'avatar': 'passport',
    },
  ];
  //if we can get this sorted by date and grouped by date that be a huuuuge favor
  static final expensesList = [
    {
      'tag': '108',
      'expense-title': 'Pizza',
      'location': 'Dominos',
      'date': DateTime(2022, 8, 10),
      'amount': 300,
      'avatar': 'mario'
    },
    {
      'tag': '100',
      'expense-title': 'Food',
      'location': 'Chowpati',
      'date': DateTime(2022, 8, 14),
      'amount': 500,
      'avatar': 'apple'
    },
    {
      'tag': '101',
      'expense-title': 'Coffee',
      'location': 'Nescafe',
      'date': DateTime(2022, 8, 14),
      'amount': -50,
      'avatar': 'drink'
    },
    {
      'tag': '102',
      'expense-title': 'Pizza',
      'location': 'Dominos',
      'date': DateTime(2022, 8, 14),
      'amount': 300,
      'avatar': 'mario'
    },
    {
      'tag': '103',
      'expense-title': 'Food',
      'location': 'Chowpati',
      'date': DateTime(2022, 8, 12),
      'amount': 500,
      'avatar': 'apple'
    },
    {
      'tag': '104',
      'expense-title': 'Coffee',
      'location': 'Nescafe',
      'date': DateTime(2022, 8, 12),
      'amount': 50,
      'avatar': 'drink'
    },
    {
      'tag': '105',
      'expense-title': 'Pizza',
      'location': 'Dominos',
      'date': DateTime(2022, 8, 12),
      'amount': 300,
      'avatar': 'mario'
    },
    {
      'tag': '106',
      'expense-title': 'Food',
      'location': 'Chowpati',
      'date': DateTime(2022, 8, 10),
      'amount': 500,
      'avatar': 'apple'
    },
    {
      'tag': '107',
      'expense-title': 'Coffee',
      'location': 'Nescafe',
      'date': DateTime(2022, 8, 10),
      'amount': 50,
      'avatar': 'drink'
    },
    {
      'tag': '108',
      'expense-title': 'Pizza',
      'location': 'Dominos',
      'date': DateTime(2022, 8, 10),
      'amount': 300,
      'avatar': 'mario'
    },
  ];
  static const List<Map> splitExpensesList = [
    {
      'amount': 450,
      'split-among': ['blah', 'badi', 'bu', 'blah', 'all'],
      'spent-on': 'Food',
      'spent-by': 'blah',
      'spent-by-avatar': 'mario',
    },
    {
      'amount': 40,
      'split-among': ['blah', 'all'],
      'spent-on': 'Chips',
      'spent-by': 'blah',
      'spent-by-avatar': 'mario',
    },
    {
      'amount': 500,
      'split-among': ['blah', 'bu', 'blah', 'all'],
      'spent-on': 'Food',
      'spent-by': 'badi',
      'spent-by-avatar': 'yoga',
    },
    {
      'amount': 410,
      'split-among': ['blah', 'badi', 'bu', 'blah', 'all'],
      'spent-on': 'Food',
      'spent-by': 'blah',
      'spent-by-avatar': 'mario',
    },
    {
      'amount': 450,
      'split-among': ['blah', 'badi', 'bu', 'blah', 'all'],
      'spent-on': 'Food',
      'spent-by': 'blah',
      'spent-by-avatar': 'mario',
    },
    {
      'amount': 450,
      'split-among': ['blah', 'badi', 'bu', 'blah', 'all'],
      'spent-on': 'Food',
      'spent-by': 'blah',
      'spent-by-avatar': 'mario',
    },
    {
      'amount': 450,
      'split-among': ['blah', 'badi', 'bu', 'blah', 'all'],
      'spent-on': 'Food',
      'spent-by': 'blah',
      'spent-by-avatar': 'mario',
    },
    {
      'amount': 450,
      'split-among': ['blah', 'badi', 'bu', 'blah', 'all'],
      'spent-on': 'Food',
      'spent-by': 'blah',
      'spent-by-avatar': 'mario',
    },
    {
      'amount': 450,
      'split-among': ['blah', 'badi', 'bu', 'blah', 'all'],
      'spent-on': 'Food',
      'spent-by': 'blah',
      'spent-by-avatar': 'mario',
    },
    {
      'amount': 450,
      'split-among': ['blah', 'badi', 'bu', 'blah', 'all'],
      'spent-on': 'Food',
      'spent-by': 'blah',
      'spent-by-avatar': 'mario',
    },
    {
      'amount': 450,
      'split-among': ['blah', 'badi', 'bu', 'blah', 'all'],
      'spent-on': 'Food',
      'spent-by': 'blah',
      'spent-by-avatar': 'mario',
    },
  ];
  static const List<Map> splitSettlementsList = [
    {
      'amount': 450,
      'from': 'username1',
      'from-avatar': 'yoga',
      'to': 'username2',
      'to-avatar': 'woman',
    },
    {
      'amount': 160,
      'from': 'username2',
      'from-avatar': 'einstein',
      'to': 'username3',
      'to-avatar': 'man',
    },
    {
      'amount': 40,
      'from': 'username4',
      'from-avatar': 'mario',
      'to': 'username5',
      'to-avatar': 'ghost',
    },
    {
      'amount': 450,
      'from': 'username1',
      'from-avatar': 'yoga',
      'to': 'username2',
      'to-avatar': 'woman',
    },
  ];
  static const List<Map> splitParticipantList = [
    {
      'username': 'user1',
      'avatar': 'yoga',
      'spent': 460,
    },
    {
      'username': 'user2',
      'spent': 130,
      'avatar': 'woman',
    },
    {
      'username': 'user3',
      'spent': 10,
      'avatar': 'einstein',
    },
    {
      'username': 'user4',
      'spent': 1000,
      'avatar': 'man',
    },
    {
      'username': 'user5',
      'spent': 500,
      'avatar': 'ghost',
    },
    {
      'username': 'user6',
      'spent': 43,
      'avatar': 'mario',
    },
    {
      'username': 'user7',
      'spent': 46,
      'avatar': 'blaster',
    },
  ];
}
