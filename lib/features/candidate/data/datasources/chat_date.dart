const chatData = {
  "users": [
    {
      "id": "u1",
      "firstName": "John",
      "lastName": "Doe",
      "phone": "+123456789",
      "email": "john.doe@example.com",
      "password": "password123",
      "username": "johndoe",
      "gender": "Male",
      "type": "Candidate",
      "cname": "TechCorp",
      "country": "USA",
      "region": "California",
      "cabout": "Leading tech solutions provider.",
      "cdesc": "We specialize in AI and cloud computing.",
      "csector": "Technology",
      "sector": "Software Development",
      "skills": ["Flutter", "Dart", "React", "Node.js"],
      "summary": "Experienced software developer with a passion for building scalable apps.",
      "title": "Software Developer",
      "avatarImage": "https://example.com/avatar/johndoe.png",
      "isVerified": "true",
      "workSet": [
        {
          "id": "w1",
          "job_title": "Frontend Developer",
          "company": "TechCorp",
          "company_location": "San Francisco",
          "work_type": "Full-time",
          "startDate": "2020-01-01",
          "endDate": "2022-12-31"
        },
        {
          "id": "w2",
          "job_title": "Software Engineer",
          "company": "Innovatech",
          "company_location": "New York",
          "work_type": "Part-time",
          "startDate": "2023-01-01",
          "endDate": "Present"
        }
      ],
      "educationSet": [
        {
          "id": "e1",
          "degree": "BSc Computer Science",
          "college": "Stanford University",
          "startDate": "2015-09-01",
          "endDate": "2019-06-01"
        },
        {
          "id": "e2",
          "degree": "MSc Software Engineering",
          "college": "MIT",
          "startDate": "2019-09-01",
          "endDate": "2021-06-01"
        }
      ]
    }
  ],
  "chats": [
    {
      "id": "c1",
      "chatName": "Development Team",
      "users": [
        {"id": "u1", "firstName": "John", "lastName": "Doe", "username": "johndoe"},
        {"id": "u2", "firstName": "Jane", "lastName": "Smith", "username": "janesmith"}
      ],
      "isGroupChat": true,
      "latestMessage": {
        "id": "m1",
        "content": "Don't forget the meeting tomorrow!",
        "createdAt": "2023-05-10T10:00:00Z",
        "updatedAt": "2023-05-10T10:05:00Z"
      },
      "groupAdmin": {"id": "u2", "firstName": "Jane", "lastName": "Smith", "username": "janesmith"}
    }
  ]
};
