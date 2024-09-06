import 'package:flutter/material.dart';
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

  @override
  void initState() 
  {
    super.initState();
    webtoon =ApiService.getToonById(widget.id);

    episodes = ApiService.getLatestEpisodesById(widget.id);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor: Colors.white,
      appBar: AppBar( 
                      backgroundColor: Colors.white30,
                      foregroundColor: Colors.green,
                      elevation: 10,
                      title:  Text(widget.title,
                      style: const TextStyle(fontSize: 24,
                      fontWeight: FontWeight.w700),
                      
                      ),
                    ),


      body: Column(
        children: [
                    const SizedBox(height: 20,),
                    
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
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: Column(
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
                                ),
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
                                            {
                                              const Text(''),
                                            }

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
    );
  }
}