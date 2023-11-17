import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
class SuccessStories extends StatefulWidget {
  final int i;
  const SuccessStories({super.key, required this.i});

  @override
  State<SuccessStories> createState() => _SuccessStoriesState();
}

class _SuccessStoriesState extends State<SuccessStories> {
  List imgs=['https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Sylvester_Stallone_Cannes_2019.jpg/330px-Sylvester_Stallone_Cannes_2019.jpg',
    'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTt8HZeoaro660SmVo3nBxD8EhGpsAueaKq1MB__HqDM2CJOhWf',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Arnold_Schwarzenegger_1974.jpg/220px-Arnold_Schwarzenegger_1974.jpg',
    'https://www.jkrowling.com/wp-content/uploads/2022/05/J.K.-Rowling-2021-Photography-Debra-Hurford-Brown-scaled.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/MKr25425_Steven_Spielberg_%28Berlinale_2023%29.jpg/330px-MKr25425_Steven_Spielberg_%28Berlinale_2023%29.jpg',
  ];
  List story=[
    "Most people don’t know this about Sylvester Stallone, but he had a dream as a young man to become a big movie star in Hollywood.  He longed to become a great director, producer, and writer.   But of course, everyone told him it could not be done.  But, he wasn’t one to take no for an answer. And after finding little luck in the New York’s films scene, he decided to try his chances in Los Angeles."
 'As luck would have it, his life in Los Angeles was not all sunshine and rainbows.  He struggled and strived for a few years in Los Angeles as well.  At one point, things got so bad and he was so short on money that he had to take his wife’s jewelry, and sell it without her permission just to make a few extra dollars.'
  'He even went through a short period of homelessness, spending a few nights sleeping on the floor of a bus station.  But the worst of his dire straits would be when he had to sell his dog because he could barely keep him fed.'
 'Struggle was a way of life for Sylvester Stallone for many years.  But he was willing to suffer through barely making ends meet , so long as he could keep taking shots at roles, regardless of the size.  He was willing to go through hell so long as there was the potential to fulfill his dream of making it in Hollywood.'
  ,
    "Oprah Winfrey is the multi-billionaire media executive and philanthropist who has been inspiring people all over the world since the early 80’s. She the host of one of the most popular talk shows in American history, and she has since starred in a handful of hit movies and founded her very own highly successful media company known as OWN."
    'So, considering Oprah Winfrey is a billionaire, media mogul, and philanthropist that has achieved more success than most people could ever imagine, and who has impacted culture on a global level, we’ve decided to publish her success story. Our aim is to see what we can learn from one of the most successful women in the world?'
    'Oprah started from humble beginnings and worked her way to the top, becoming a household name. Her story is one of inspiration and proves that anything is possible with hard work and determination.'
  'Oprah Gail Winfrey was born on January 29, 1954, in Kosciusko, Mississippi. She was initially raised in poverty by bother her single mother and her grandmother early on in her life. And would move from household to household on more than one occasion.'
  'Indeed Oprah’s childhood was marred by many challenges early on. But the trauma she experienced early on really began when her mother asked a family member to watch Oprah, since she couldn’t as she was business trying to keep her job and the bills paid. Unfortunately, this family member whom was her 19 year old cousin eventually raped her.'
  'The trauma didn’t stop there though, as Oprah would eventually encounter many more instances of sexual abuse due to a lack of parental support. There’s little doubt that these abusive experiences led Oprah to an early life of rebelliousness, petty crime (like stealing money from her grandmother), and drugs.'
  'Oprah’s tumultuous childhood eventually led to an unexpected pregnancy at the age of 14. Upon delivery of her baby, who died shortly after being born, Oprah realized that if she kept doing the same things, she would ruin her life. So, she decided, with the help of her father, turn her life around.'
  'Despite the turmoil in her youth, Oprah was always a lover of reading. This was something instilled in her by her grandmother in her early years.'
  'So, when she got ahold of the autobiography of Maya Angelou’s “I Know Why the Caged Bird Sings”, she felt seen and validated in a way that she never knew was possible.'
  'This book was a turning point for Oprah and she began to see the power of words. She realized that she could use her voice to make a difference in the world. From then on, Oprah was determined to succeed. She focused on her education as well as public speaking, which led to her receiving a full college scholarship.'
  'She attended Tennessee State University where she developed her strengths in journalism and media, marking her destiny for success.',
    'Early Days'
  'These days Arnold Schwarzenegger is a household name, especially in the USA. However, he was born in the country of Austria in 1947.  Being born and raised in a country that had just suffered through a brutal defeat in a world war, had a huge impact on Arnold.'
  'It is said that the alcoholism became rampant after the war, and that there was little food, and lots of poverty throughout the country due to the post-war occupation.  As it was these conditions that negatively impacted the moral of many of the men throughout the country for years, including Arnold’s father.'
  'Bodybuilding'
  'It was these initial conditions that would eventually motivate Arnold to want to escape from Austria to America as soon as he could.  Fortunately for Arnold, at the young age of 15, he discovered his “golden ticket” and his way out after Austria after learning about Reg Park.'
  'Reg Park was a champion body builder who leveraged his success in body building to make it into Hollywood.  And it was after learning of this man and his success, that Arnold definitively decided what he wanted to be and do with his life.'
  'After five short years of learning of his success plan, and after putting in five hours a day six days a week in the gym, Arnold would become the youngest European Champion bodybuilder at the astonishing age of 20.  And for the next 15 years Arnold would go on to Dominate the field of bodybuilding.',
    'J.K Rowling had a dream of becoming a writer early on. But, she would have to persist for many years before her dream of becoming a published author would materialize. Almost as soon as she decided to get to work on putting her ideas down on paper for her book, she would be sidetracked by her mother’s death.'
  'The depression that would ensue left Rowling seeking out a job as a teacher in another country. Soon after, she married and had a child, which would delay her aspirations even further.'
  'But things weren’t done going off the rails for Rowling, as her marriage would abruptly end just one year after it began. This lead to her being jobless with a child, and a barely surviving off of unemployment benefits.'
  'However, despite her challenges, Rowling would persist in the creation of her book. And she did so by seizing every spare moment she could while her child slept to write. Until finally the day came when she completed her manuscript.'
  'Of course, even after Rowling finished her manuscript obstacles still remained. 12 different publishers rejected her novel. The rejection took a toll on her spirits, and she almost quit. Fortunately, she tried one more time. And it was at that moment, that J.K. Rowling’s luck turned around. She finally found a publisher would accepted her manuscript.'
  'Now, J.K. Rowling is now one of the best selling authors of all time. She is also the highest paid novelist in the world. Her books have been translated into over 80 different languages with over 600 million sold. Clearly, persistence and patience pays off in the long run.',
    'Most people don’t know this, but Steven Spielberg was rejected from film school three times. But he didn’t let those rejections stop him, and he kept applying till he got accepted.  Eventually Cal State, Long Beach would accept him into their film program. '
  'Fortunately for Spielberg, he would then go on to leverage his opportunity at Cal State to land an unpaid internship at Universal Studios.'
  'Of course, this internship wouldn’t last forever, but it lasted just long enough for him to learn how sneak in to the studios undetected so he could continually gather intel on what it would take to become successful in the business.'
  'Finally, the day would come that he managed to get a film he created in the hands of film executives. But, he had to first overcome the film executives multiple attempts to make him give up.'
  'After being told that the film size was not the right size multiple times, and remaking the entire demo to the recommended sizes every time, the executives finally relented and gave him his film a shot. The movie would go on to win major awards, and solidified Steven Spielberg’s place within the industry.'
  'Steven Spielberg is now one of the most influential film makers in history. On top of this, he’s now also one of the wealthiest. And out of all of our inspirational stories of success, his story in particular, shows, that if you knock long enough and hard enough, the doors of opportunity will eventually swing open for you.'
  ];
   List personName=['Sylvster Stallone','Oprah Winfrey','Arnold Schwarzenegger','JK Rowling','Steven Spielberg'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(personName[widget.i],style: GoogleFonts.varela(),),
      ),
      body: ListView(
        children: [
          SizedBox(height: 40.h,width: 90.w,child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(imgs[widget.i],fit: BoxFit.fill,),
            ),
          ),),
          SizedBox(height: 1.h,),
          Card(
            child: Text(story[widget.i],style: GoogleFonts.varela(fontSize: 15.sp),),
          )
        ],
      ),
    );
  }
}
