document.addEventListener("DOMContentLoaded", function () {
    // Function to fetch the client's IP address
    function fetchIPAddress() {
        fetch('https://api64.ipify.org?format=json')
            .then(response => response.json())
            .then(data => {
                document.getElementById('ip-address').innerText = `Date on Webserver IP Address: ${data.ip}`;
            })
            .catch(error => {
                console.error('Error fetching IP address:', error);
            });
    }

    // Function to update the current date
    function updateCurrentDate() {
        const options = { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit', hour12: false };
        const formattedDate = new Date().toLocaleString('en-US', options);
        document.getElementById('current-date').innerText = `is : ${formattedDate}`;
    }

    // Call functions to fetch IP address and update current date
    fetchIPAddress();
    updateCurrentDate();
});
