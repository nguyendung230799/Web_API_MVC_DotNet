var spinnerVisible = false;
function showProgress() {
    if (!spinnerVisible) {
        $("#cover-spin").fadeIn("fast");
        $("#cover-spin").show()
        spinnerVisible = true;
    }
};
function hideProgress() {
    if (spinnerVisible) {
        var spinner = $("#cover-spin");
        spinner.stop();
        spinner.fadeOut("fast");
        spinnerVisible = false;
    }
};

async function subscribeToPushMessages() {
    const serviceWorkerRegistration = await navigator.serviceWorker.ready;

    // Check if the user has an existing subscription
    let pushSubscription = serviceWorkerRegistration.pushManager.getSubscription();
    if (pushSubscription) {
        // The user is already subscribed to push notifications
        return;
    }

    try {
        // Subscribe the user to push notifications
        pushSubscription = await serviceWorkerRegistration.pushManager.subscribe({
            userVisibleOnly: true,
            applicationServerKey: urlBase64ToUint8Array("YOUR PUBLIC VAPID KEY HERE")
        });
    } catch (err) {
        // The subscription wasn't successful.
        console.log("Error", err);
    }
}

// Utility function for browser interoperability
function urlBase64ToUint8Array(base64String) {
    var padding = '='.repeat((4 - base64String.length % 4) % 4);
    var base64 = (base64String + padding)
        .replace(/\-/g, '+')
        .replace(/_/g, '/');

    var rawData = window.atob(base64);
    var outputArray = new Uint8Array(rawData.length);

    for (var i = 0; i < rawData.length; ++i) {
        outputArray[i] = rawData.charCodeAt(i);
    }
    return outputArray;
}

//if ("serviceWorker" in navigator) {
//    navigator.serviceWorker
//        .register("../../serviceworker.js")
//        .then((serviceWorkerRegistration) => {
//            console.log('Service Worker Registered!', serviceWorkerRegistration);
//            serviceWorkerRegistration.pushManager.subscribe({ userVisibleOnly: true }).then(
//                (pushSubscription) => {
//                    console.log(pushSubscription.endpoint);
//                },
//                (error) => {
//                    console.error(error);
//                },
//            );
//        });
//}

