import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webtoon/models/webtoon_detail_model.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';
import 'package:webtoon/services/api_service.dart';

class DetailScreen extends StatefulWidget {

  const DetailScreen({super.key, required this.title, required this.thumb, required this.id });
  final String title, thumb,id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();


  
}

class _DetailScreenState extends State<DetailScreen> 
{
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences pref;
  bool isLike = false;
  Future initFref()async
  {
    pref = await SharedPreferences.getInstance();
   final likedToon = pref.getStringList("likedToons");
   if(likedToon ==null)
   {
      if(likedToon!.contains(widget.id) ==true)
      {
        isLike=true;
      }
   }else{
    await pref.setStringList("likedToons", []);
   }
  }

  @override
  void initState() 
  {
    super.initState();
    webtoon =ApiService.getToonById(widget.id);

    episodes = ApiService.getLatestEpisodesById(widget.id);
    initFref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor: Colors.white,
      appBar: AppBar( 
                      backgroundColor: Colors.white30,
                      foregroundColor: Colors.green,
                      actions: [
                        IconButton(onPressed: (){}, 
                         icon:isLike ? Icon(Icons.favorite_outlined): Icon(Icons.face_4_rounded)),
                      ],
                      elevation: 10,
                      title:  Text(widget.title,
                      style: const TextStyle(fontSize: 24,
                      fontWeight: FontWeight.w700),
                      
                      ),
                    ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
                        //const SizedBox(height: 20,),
                        
                        Column(
                        children: 
                        [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Hero(
                                tag: widget.id,
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  width: 250,
                                  
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 7,
                                        offset: const Offset(10, 10),
                                        color: Colors.black.withOpacity(0.3),
                                              ),
                                              ]
                                                          ),
                                  child: Image.network(widget.thumb),
                                ),
                              ),
                            ],
                          ),
                           const SizedBox(height: 20,),
                           Text(widget.title,
                              style: const TextStyle(fontSize: 22,
                                                fontWeight: FontWeight.w600),),
                           FutureBuilder(
                              future: webtoon,
                              builder: (context, snapshot) 
                              {
                                if(snapshot.hasData)
                                {
                                  return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  
                                    children: [
                                      Text(snapshot.data!.about, style: const TextStyle(fontSize: 13,
                                                                                         fontWeight: FontWeight.w300,
                                                                                         color: Colors.grey),),
                                      const SizedBox(height: 15,),                                                  
                                      Text("${snapshot.data!.genre} / ${snapshot.data!.age}", style: const TextStyle(fontSize: 15,
                                                                                         fontWeight: FontWeight.w700,
                                                                                         color: Colors.black),),
                                    ],
                                  );
                                }
                                return const Text(". . .");
                              },
                            ),
                          const SizedBox(height: 10,),
                          FutureBuilder(future: episodes, 
                                        builder: (context,snapshot)
                                        {
                                          if(snapshot.hasData)
                                          {
                                            return Column(
                                              children: [
                                                for(var episode in snapshot.data!)
                                                    webbtonEpisode(episode: episode, 
                                                    webtoon_id : widget.id),
                                                
          
                                              ],
                                            );
                                          }
                                          return Container();
                                        },
                          )
          
                          
                          
                        ],
                      ),
          
          
                      ],
          ),
        ),
      ),
    );
  }
}

class webbtonEpisode extends StatelessWidget {
  const webbtonEpisode({
    super.key,
    required this.episode,
    required this.webtoon_id,
  });

  final WebtoonEpisodeModel episode;
  final String webtoon_id;
  onButtonTab() async
  {
    final url = Uri.parse("https:/comic.naver.com/webtoon/detail?titleId=${webtoon_id}&no=${episode.id}");
    await launchUrl(url);
    //launchUrlString(urlString)
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTab,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border:Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(10),
          color: Colors.amber.withOpacity(0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
            [
              Text(episode.title,style: 
                  const TextStyle(color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w200),
      
              ),
              const Icon(Icons.chevron_right_rounded,color: Colors.black,),
              
            ],
          ),
        ),
      ),
    );
  }
}