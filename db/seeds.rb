require 'date'

osu = School.create!(
  name: 'Oregon State University',
  url: 'http://oregonstate.edu/',
  screenshot: 'beav.png',
  location: 'Corvallis, OR (remote)',
  degree: 'coursework towards B.S., Computer Science',
  start_date: Date.parse('February 2018'),
  end_date: Date.parse('December 2018'),
  summary: 'Full-time pursuit of a B.S. in Computer Science with coursework in data structures and algorithms, web development, CS fundamentals, operating systems, and computer architecture including group work and projects.'
)

osu.subject_list.add('Computer Science, C, Data Structures, Algorithms', parse: true)
osu.honor_list.add('none', parse: true)
osu.save

cal = School.create!(
  name: 'University of California, Berkeley',
  url: 'https://www.berkeley.edu',
  screenshot: 'oski.png',
  location: 'Berkeley, CA',
  degree: 'B.A., Classical Civilizations',
  start_date: Date.parse('August 2012'),
  end_date: Date.parse('August 2015'),
  summary: 'I attended Cal for three years as a transfer, first studying Scandinavian Studies with a Danish language emphasis, then Classics with a Latin language emphasis. During my senior year I won the Joost Fellowship, which is awarded to one UC Berkeley classicist each year to spend five weeks in Rome learning the intricacies of Latin syntax by speaking and living Latin with the Paideia Institute.'
)
cal.subject_list.add('Latin, Scandinavian Studies', parse: true)
cal.honor_list.add('Joost Fellowship, Golden Key International Honor Society, proxima cum laude', parse: true)
cal.save

butte = School.create!(
  name: 'Butte Community College',
  location: 'Oroville, CA',
  screenshot: 'roadrunner.jpg',
  url: 'https://www.butte.edu',
  degree: 'Transfer Degree',
  start_date: Date.parse('January 2011'),
  end_date: Date.parse('July 2012'),
  summary: "I spent a short time at Butte College, but packed a lot into my time there. I fulfilled all the lower-level requirements and began upper-level coursework in Economics while tutoring in Economics at the school's Center for Academic Success. I also pursued coursework in Multivariable Calculus in preparation for further Economics study."
)
butte.subject_list.add('Economics, Calculus', parse: true)
butte.honor_list.add('Phi Theta Kappa Honors Society, Economics Tutor', parse: true)
butte.save

csuc = School.create!(
  name: 'California State University, Chico',
  location: 'Chico, CA',
  screenshot: 'wildcat.png',
  url: 'https://www.csuchico.edu',
  degree: 'Concurrent Enrollment in High School',
  start_date: Date.parse('January 2009'),
  end_date: Date.parse('July 2011'),
  summary: "I started studying at CSU Chico while concurrently enrolled as a junior in high school. I continued studying various subjects there off and on as-needed through high school and into community college."
)
csuc.subject_list.add('Calculus, German, Women\'s Studies', parse: true)
csuc.honor_list.add('High School Scholars Program', parse: true)
csuc.save


cpotts = Project.create!(
  name: 'Tony\'s Electonics Emporium',
  url: 'https://github.com/kamillamagna/caractacus-potts',
  deployment: 'http://caractacus-potts.herokuapp.com',
  screenshot: 'cs340.png',
  when: Date.parse('December 2018'),
  description: 'MySQL/Node application for selling junk.',
  project_type: 'school'
)
cpotts.keyword_list.add('node, mysql, api, ajax, javascript, sql', 'group', parse: true)
cpotts.save

metpro = Project.create!(
  name: 'React-ify Metpro Assessment',
  url: 'https://github.com/kamillamagna',
  deployment: 'https://github.com/kamillamagna',
  screenshot: 'metpro.png',
  when: Date.parse('August 2018'),
  description: 'Conversion of Metpro\'s body type assessment from HTML/jQuery to React.js and Redux',
  project_type: 'contract'
)
metpro.keyword_list.add('react, redux, html, javascript, ui', 'group', parse: true)
metpro.save

paideiafication = Project.create!(
  name: 'Paideia Institute Style Guide',
  url: 'https://github.com/kamillamagna',
  deployment: 'https://github.com/kamillamagna',
  screenshot: 'paideiafication.png',
  when: Date.parse('March 2018'),
  description: 'Styling Paideia Institute\'s Teachable page to match their Nationbuilder website, leading to creation of the Paideia Institute Style Guide',
  project_type: 'contract'
)
paideiafication.keyword_list.add('html, css, ui, branding', 'group', parse: true)
paideiafication.save

opca = Project.create!(
  name: 'Online Public Classics Archive',
  url: 'https://github.com/kamillamagna/classics-archive',
  deployment: 'http://opca.paideiainstitute.org/articles',
  screenshot: 'opca.png',
  when: Date.parse('January 2018'),
  description: 'searchable repository for modern scholarship about the classics built in conjunction with the Paideia Institute and Eidolon',
  project_type: 'professional'
)
opca.keyword_list.add('ruby, rails, javascript, postgresql, search, filter, tag, oauth, bootstrap, latin', parse: true)
opca.save

nmf = Project.create!(
  name: 'Marfan Registry',
  url: 'https://github.com/kamillamagna/NMF_Tool',
  deployment: 'https://marfan-registry.herokuapp.com/',
  screenshot: 'nmf',
  when: Date.parse('August 2017'),
  description: 'clinical and research tool for diagnosis and treatment of symptoms related to connective tissue disorders',
  project_type: 'professional'
)
nmf.keyword_list.add('ruby, rails, webpack, javascript, jquery, postgresql, file attachment', parse: true)
nmf.save

urbanite = Project.create!(
  name: 'Urbanite',
  url: 'https://github.com/nwalberts/urbanite',
  deployment: 'https://github.com/nwalberts/urbanite',
  screenshot: 'urbanite.png',
  when: Date.parse('April 2016'),
  description: 'The most epic city review app ever',
  project_type: 'professional'
)
urbanite.keyword_list.add('ruby, rails, api, tdd, javascript, postgresql, authentication, authorization', 'group', parse: true)
urbanite.save

dihtfapsl = Project.create!(
  name: 'Do I Have Time for a Pumpkin Spice Latte?',
  url: 'https://github.com/kamillamagna/DIHTFAPSL',
  deployment: 'https://kamilleski.github.io/',
  screenshot: 'dihtfapsl.jpg',
  when: Date.parse('June 2015'),
  description: "Asking the most existential question of my fellow basic bitches: Do I Have Time for a Pumpkin Spice Latte?",
  project_type: 'hobby'
)
dihtfapsl.keyword_list.add('ruby, rails, api, tdd, javascript, postgresql, authentication, authorization', parse: true)
dihtfapsl.save

latin = Project.create!(
  name: 'Latin Lover',
  url: 'https://github.com/kamillamagna/Latin-Lover',
  deployment: 'https://github.com/kamillamagna/Latin-Lover',
  screenshot: 'latinlover.jpg',
  when: Date.parse('March 2016'),
  description: 'Submit a word in English and see its translation in various Romance languages all at once.',
  project_type: 'hobby'
)
latin.keyword_list.add('ruby, rails, api, tdd, javascript, postgresql, authentication, authorization', parse: true)
latin.save

campusverus = Project.create!(
  name: 'Campus Verus',
  url: 'https://github.com/kamillamagna/Campus-Verus',
  deployment: 'https://campus-verus.herokuapp.com/',
  screenshot: 'campusverus.jpg',
  when: Date.parse('May 2017'),
  description: 'Making the world a better place one college tour at a time.',
  project_type: 'professional'
)
campusverus.keyword_list.add('ruby, rails, api, tdd, javascript, postgresql, authentication, authorization', parse: true)
campusverus.save

launch = Project.create!(
  name: 'Launch Academy Challenges',
  url: 'https://github.com/kamillamagna/launch-academy-challenges',
  deployment: 'https://github.com/kamillamagna/launch-academy-challenges',
  screenshot: 'launch.jpg',
  when: Date.parse('April 2017'),
  description: 'Ignition and Onsite Challenges for Launch Academy',
  project_type: 'professional'
)
launch.keyword_list.add('ruby, rails, test-driven-development, javascript, postgresql', parse: true)
launch.save
