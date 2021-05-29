import QtQuick 2.0
import QtQuick.XmlListModel 2.12
//Application name	automotive
//API key	c8bdf0a5e03f41582ddb09e74f2ad3de
//Shared secret	795248719d2583faa70a7082b683cf6b
//Registered to	kovastos


Item {
    id:info
    property string artist
    property variant lastArtist
    XmlListModel{
    id: nfoFm
    source: "http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist="+info.artist+"&api_key=c8bdf0a5e03f41582ddb09e74f2ad3de"
    query: "/lfm/artist"
    XmlRole{name: "name";query: "name/string()"}
    XmlRole{name: "mbid";query: "mbid/string()"}
    XmlRole{name: "url";query: "url/string()"}
    XmlRole{name: "imageSma";query: "image[1]/string()"}
    XmlRole{name: "imageMed";query: "image[2]/string()"}
    XmlRole{name: "imageLar";query: "image[3]/string()"}
    XmlRole{name: "imageExl";query: "image[4]/string()"}
    XmlRole{name: "imageMega";query: "image[5]/string()"}
    //stats
    XmlRole{name: "ontour";query: "ontour/string()"}
    XmlRole{name: "listener";query: "stats/listener/string()"}
    //similar artist
    //0
    XmlRole{name: "similar0Name";query: "similar/artist[0]/name/string()"}
    XmlRole{name: "similar0Url";query: "similar/artist[0]/url/string()"}
    XmlRole{name: "similar0ImgMed";query: "similar/artist[0]/image[2]/string()"}
    XmlRole{name: "similar0ImgLrg";query: "similar/artist[0]/image[3]/string()"}
    //1
    XmlRole{name: "similar1Name";query: "similar/artist[1]/name/string()"}
    XmlRole{name: "similar1Url";query: "similar/artist[1]/url/string()"}
    XmlRole{name: "similar1ImgMed";query: "similar/artist[1]/image[2]/string()"}
    XmlRole{name: "similar1ImgLrg";query: "similar/artist[1]/image[3]/string()"}
    //2
    XmlRole{name: "similar2Name";query: "similar/artist[2]/name/string()"}
    XmlRole{name: "similar2Url";query: "similar/artist[2]/url/string()"}
    XmlRole{name: "similar2ImgMed";query: "similar/artist[2]/image[2]/string()"}
    XmlRole{name: "similar2ImgLrg";query: "similar/artist[2]/image[3]/string()"}
    //3
    XmlRole{name: "similar3Name";query: "similar/artist[3]/name/string()"}
    XmlRole{name: "similar3Url";query: "similar/artist[3]/url/string()"}
    XmlRole{name: "similar3ImgMed";query: "similar/artist[3]/image[2]/string()"}
    XmlRole{name: "similar3ImgLrg";query: "similar/artist[2]/image[3]/string()"}
    //bio and description

     XmlRole{name: "published";query: "bio/published/string()"}
     XmlRole{name: "summary";query: "bio/summary/string()"}
     XmlRole{name: "content";query: "bio/content/string()"}
     XmlRole{name: "yearformed";query: "bio/yearformed/string()"}






        onStatusChanged: {
        if (status===XmlListModel.Error) {
            console.log(errorString())
            reload()
        }
        if (status===XmlListModel.Ready) {
            console.log(errorString())
            if(count>0)
                info.lastArtist=nfoFm.get(0)

        }
        }
   }
}

