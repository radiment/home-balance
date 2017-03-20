<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Incomes page!</title>
    <script src="webjars/vue/2.1.3/vue.js"></script>
    <script src="webjars/vue-resource/1.2.1/dist/vue-resource.js"></script>
</head>
<body>
<h2>Incomes page</h2>

<div id="app">
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Value</th>
            </tr>
        </thead>
        <tr v-for="income in incomes">
            <td>{{ income.name }}</td>
            <td>{{ income.value }}</td>
        </tr>
    </table>
    <button v-on:click="fetchData">Increment</button>
</div>
<script>
    var vi = new Vue({
        el: '#app',
        data: function () {
            return {
                incomes: [],
                isLoading: false,
                fetchError: null
            }
        },
        watch: {
            '$route': function () {
                var self = this;
                self.isLoading = true;
                self.fetchData().then(function () {
                    self.isLoading = false
                })
            }
        },
        methods: {
            fetchData: function () {
                var self = this;
                return this.$http.get("/rest/income")
                        .then(function (response) {
                            self.incomes = response.data._embedded.income
                        })
                        .catch(function (error) {
                            self.fetchError = error
                        })
            }
        }
    });
    vi.fetchData();
</script>
</body>
</html>