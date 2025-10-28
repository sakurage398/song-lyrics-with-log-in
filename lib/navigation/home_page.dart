import 'package:flutter/material.dart';
import 'lyrics_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> songs = const [
    {
      'title': 'Imagine',
      'lyrics': 'Imagine there\'s no heaven\nIt\'s easy if you try\nNo hell below us\nAbove us, only sky\n\nImagine all the people\nLiving for today...',
      'music': 'John Lennon'
    },
    {
      'title': 'Bohemian Rhapsody',
      'lyrics': 'Is this the real life?\nIs this just fantasy?\nCaught in a landslide\nNo escape from reality\n\nOpen your eyes\nLook up to the skies and see...',
      'music': 'Queen'
    },
    {
      'title': 'Yesterday',
      'lyrics': 'Yesterday\nAll my troubles seemed so far away\nNow it looks as though they\'re here to stay\nOh, I believe in yesterday...',
      'music': 'The Beatles'
    },
    {
      'title': 'Blinding Lights',
      'lyrics': 'I been tryna call\nI been on my own for long enough\nMaybe you can show me how to love, maybe\n\nI\'m going through a maze\nAnd my heart\'s been out of place...',
      'music': 'The Weeknd'
    },
    {
      'title': 'Shape of You',
      'lyrics': 'The club isn\'t the best place to find a lover\nSo the bar is where I go\nMe and my friends at the table doing shots\nDrinking fast and then we talk slow...',
      'music': 'Ed Sheeran'
    },
    {
      'title': 'Dance Monkey',
      'lyrics': 'They say oh my god I see the way you shine\nTake your hand, my dear, and place them both in mine\nYou know you stopped me dead while I was passing by\nAnd now I beg to see you dance just one more time...',
      'music': 'Tones and I'
    },
    {
      'title': 'Bad Guy',
      'lyrics': 'White shirt now red, my bloody nose\nSleeping, you\'re on your tippy toes\nCreeping around like no one knows\nThink you\'re so criminal...',
      'music': 'Billie Eilish'
    },
    {
      'title': 'Uptown Funk',
      'lyrics': 'This hit, that ice cold\nMichelle Pfeiffer, that white gold\nThis one for them hood girls\nThem good girls straight masterpieces...',
      'music': 'Mark Ronson ft. Bruno Mars'
    },
    {
      'title': 'Despacito',
      'lyrics': 'Sí, sabes que ya llevo un rato mirándote\nTengo que bailar contigo hoy\nVi que tu mirada ya estaba llamándome\nMuéstrame el camino que yo voy...',
      'music': 'Luis Fonsi'
    },
    {
      'title': 'Happy',
      'lyrics': 'It might seem crazy what I\'m \'bout to say\nSunshine she\'s here, you can take a break\nI\'m a hot air balloon that could go to space\nWith the air, like I don\'t care baby by the way...',
      'music': 'Pharrell Williams'
    },
  ];

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Song Lyrics'),
        backgroundColor: Colors.blue[700],
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(8.0),
              color: Colors.white.withOpacity(0.8),
              child: ListTile(
                title: Text(
                  songs[index]['title']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Artist: ${songs[index]['music']}'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LyricsPage(
                        songTitle: songs[index]['title']!,
                        lyrics: songs[index]['lyrics']!,
                        music: songs[index]['music']!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}