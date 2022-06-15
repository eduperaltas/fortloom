import 'ArtistResource.dart';

class EventResource{

  final int id;
  final String eventname;
  final String eventeescription;
  final int eventlikes;
  final DateTime registerdate;
  final ArtistResource artist;

  EventResource(this.id,this.eventname,this.eventeescription,this.eventlikes,this.registerdate,this.artist);

}
