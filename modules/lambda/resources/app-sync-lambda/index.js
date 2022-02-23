exports.handler = (event, context, callback) => {
    console.log("Received event {}", JSON.stringify(event, 3));
    const movies = {
        "1": {"id": "1", "title": "Fight Club", "tagline": "Mischief. Mayhem. Soap.", "overview": "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion."},
        "2": {"id": "2", "title": "The Hours", "tagline": "The time to hide is over. The time to regret is gone. The time to live is now.", "overview": "\"The Hours\" is the story of three women searching for more potent, meaningful lives. Each is alive at a different time and place, all are linked by their yearnings and their fears. Their stories intertwine, and finally come together in a surprising, transcendent moment of shared recognition."},
        "3": {"id": "3", "title": "Jaws: The Revenge", "tagline": "This time, it’s personal.", "overview": "After another deadly shark attack, Ellen Brody decides she has had enough of New England's Amity Island and moves to the Caribbean to join her son, Michael, and his family. But a great white shark has followed her there, hungry for more lives."},
        "4": {"id": "4", "title": "Titanic", "tagline": "Nothing on Earth could come between them.", "overview": "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic, 84 years later. A young Rose boards the ship with her mother and fiancé. Meanwhile, Jack Dawson and Fabrizio De Rossi win third-class tickets aboard the ship. Rose tells the whole story from Titanic's departure through to its death—on its first and last voyage—on April 15, 1912."},
    }

    switch (event.field) {
        case
        "getMovie":
            let id = event.arguments.id;
            callback(null, movies[id]);
            break;

        case
        "movies":
            let values = [];
            for (let key in movies) {
                values.push(movies[key]);
            }
            callback(null, values);
            break;
        default:
            callback(null, "Invalid field");
            break;

    }
}
