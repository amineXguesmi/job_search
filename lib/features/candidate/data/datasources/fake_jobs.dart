import 'package:job_search/features/candidate/data/datasources/fake_ccompany.dart';

import '../models/job.dart';

final fakeJobs = [
  Job(
    id: "1",
    title: "Backend Developer",
    about:
        "We are looking for a dynamic, energetic Laravel backend developer intern who is eager to learn about our company by assisting software backend. You will be working closely with our team to conduct research on innovation, work, capture data. To be successful as an Intern, you should be willing to help with any tasks assigned by a supervisor. You will be involved in various campaigns as well as assisting with current campaigns.",
    skills: ["Laravel", "PHP", "MySQL", "Git", "API Development"],
    sallary: 60000,
    description:
        "At Verisk, you can build an exciting career with meaningful work; create positive and lasting impact on business; and find the support, coaching, and training you need to advance your career.",
    responsibilities: [
      "Support, development, and data operation workload.",
      "Coordinate and communicate effectively with team members and various stakeholders",
      "Identify and test for bugs and bottlenecks in the ETL solution.",
      "Ensure the best possible performance and quality in the packages."
    ],
    requirements: [
      "Strong knowledge in backend development",
      "Familiar with Laravel framework",
      "Experience with database management",
      "Excellent communication skills"
    ],
    openDate: "2024-01-01",
    closeDate: "2024-03-01",
    isActive: true,
    company: fakeCompany[3],
  ),
  Job(
    id: "2",
    title: "Frontend Developer",
    about:
        "We are seeking a motivated Frontend Developer to join our team. You will be responsible for developing dynamic and responsive web applications while working closely with the design and backend teams.",
    skills: ["React", "JavaScript", "CSS", "HTML", "Vue.js"],
    sallary: 50000,
    description:
        "We have received the Great Place to Work® Certification for the fifth consecutive year and are committed to offering an inclusive work environment.",
    responsibilities: [
      "Design and develop front-end applications",
      "Collaborate with the design and backend teams",
      "Ensure cross-browser compatibility",
      "Optimize web applications for maximum speed"
    ],
    requirements: [
      "Proven experience with React and Vue.js",
      "Strong understanding of JavaScript and web technologies",
      "Experience with responsive web design",
      "Ability to work in a team environment"
    ],
    openDate: "2024-02-01",
    closeDate: "2024-04-01",
    isActive: true,
    company: fakeCompany[2], // Assuming Company class exists
  ),
  Job(
    id: "3",
    title: "Data Analyst",
    about:
        "Join our team as a Data Analyst and contribute to meaningful business insights. You will be responsible for data collection, analysis, and reporting to support decision-making across the company.",
    skills: ["Data Visualization", "SQL", "Python", "Excel", "PowerBI"],
    sallary: 55000,
    description:
        "At DataCo Labs, we believe in empowering our employees and fostering an environment that supports growth, creativity, and collaboration.",
    responsibilities: [
      "Collect and analyze data from various sources",
      "Generate reports and dashboards",
      "Provide actionable insights to improve business operations",
      "Collaborate with other departments to understand data needs"
    ],
    requirements: [
      "Experience with data analysis tools",
      "Strong SQL skills",
      "Knowledge of data visualization software like PowerBI",
      "Ability to work under tight deadlines"
    ],
    openDate: "2024-03-01",
    closeDate: "2024-05-01",
    isActive: true,
    company: fakeCompany[1],
  ),
  Job(
    id: "4",
    title: "Product Manager",
    about:
        "We are looking for an experienced Product Manager to lead the product strategy and lifecycle. You will work with cross-functional teams to build and launch products that meet the market needs.",
    skills: ["Product Strategy", "Market Research", "Agile", "Team Leadership"],
    sallary: 70000,
    description:
        "At GlobalTech, you can build an exciting career with meaningful work, create positive and lasting impacts on business, and find support and training to advance your career.",
    responsibilities: [
      "Define product vision and strategy",
      "Conduct market research and competitive analysis",
      "Manage product lifecycle from concept to launch",
      "Lead cross-functional teams to deliver product solutions"
    ],
    requirements: [
      "Experience in product management",
      "Strong communication and leadership skills",
      "Ability to work with multiple teams",
      "Familiarity with Agile methodologies"
    ],
    openDate: "2024-04-01",
    closeDate: "2024-06-01",
    isActive: true,
    company: fakeCompany[0], // Assuming Company class exists
  ),
];
