<my-weather-condition>

    <span>{ keyword }</span>

    <script>

        this.keyword = '( Loading... )'

        var self = this

        fetch( 'https://query.yahooapis.com/v1/public/yql?q=select%20item.condition.text%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22' + opts.place + '%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys' )
        .then( function ( data ) {
            return data.json()
        } )
        .then( function ( json ) {
            self.keyword = json.query.results.channel.item.condition.text
            self.update()
        } )
        
    </script>

</my-weather-condition>

