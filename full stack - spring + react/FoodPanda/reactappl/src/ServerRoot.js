 var ServerRoot = (function () {
    var instance;

    function createInstance() {
        var object = new Object("http://localhost:8080");
        return object;
    }

    return {
        getInstance: function () {
            if (!instance) {
                instance = createInstance();
            }
            return instance;
        }
    };
})();
export default ServerRoot;