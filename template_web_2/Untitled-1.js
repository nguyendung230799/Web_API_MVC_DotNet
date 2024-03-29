function moneyRandom() {
  var e = $(".stats .icon-money").parent().find(".details .big"),
    t = parseFloat(e.html().replace("$", "").replace(",", ".")),
    n = Math.random() * 10,
    r = 1;
  n >= 5 && (r = -1);
  t += r * Math.floor(Math.random() * 10);
  e.html("$" + t.toFixed(2).toString().replace(".", ","));
  setTimeout(function () {
    moneyRandom();
  }, 2500);
}
function orderRandom() {
  var e = $(".stats .icon-shopping-cart").parent().find(".details .big"),
    t = parseInt(e.html()),
    n = Math.random() * 10,
    r = 1;
  n >= 5 && (r = -1);
  t += r * Math.floor(Math.random() * 3);
  e.html(t);
  setTimeout(function () {
    orderRandom();
  }, 2500);
}
function currentTime() {
  var e = $(".stats .icon-calendar").parent(),
    t = new Date(),
    n = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ],
    r = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
    ];
  e.find(".details .big").html(
    n[t.getMonth()] + " " + t.getDate() + ", " + t.getFullYear()
  );
  e.find(".details span")
    .last()
    .html(
      r[t.getDay()] +
      ", " +
      t.getHours() +
      ":" +
      ("0" + t.getMinutes()).slice(-2)
    );
  setTimeout(function () {
    currentTime();
  }, 1e4);
}
function randomFeed() {
  var e = $("#randomFeed"),
    t = new Array(
      '<span class="label"><i class="icon-plus"></i></span> <a href="#">John Doe</a> added a new photo',
      '<span class="label label-success"><i class="icon-user"></i></span> New user registered',
      '<span class="label label-info"><i class="icon-shopping-cart"></i></span> New order received',
      '<span class="label label-warning"><i class="icon-comment"></i></span> <a href="#">John Doe</a> commented on <a href="#">News #123</a>'
    ),
    n = e
      .parents(".box")
      .find(".box-title .actions .custom-checkbox")
      .hasClass("checkbox-active"),
    r = Math.floor(Math.random() * 4),
    i = t[r];
  if (n) {
    e.prepend("<tr><td>" + i + "</td></tr>")
      .find("tr")
      .first()
      .hide();
    e.find("tr").first().fadeIn();
    e.find("tbody tr").length > 20 &&
      e
        .find("tbody tr")
        .last()
        .fadeOut(400, function () {
          $(this).remove();
        });
  }
  slimScrollUpdate(e.parents(".scrollable"));
  setTimeout(function () {
    randomFeed();
  }, 3e3);
}
$(document).ready(function () {
  moneyRandom();
  orderRandom();
  currentTime();
  randomFeed();
  var e = [];
  for (var t = 0; t <= 20; t += 1)
    e.push([t, parseInt(32 + Math.random() * 35)]);
  var n = [];
  for (var t = 0; t <= 20; t += 1)
    n.push([t, parseInt(32 + Math.random() * 55)]);
  var r = [];
  for (var t = 0; t <= 10; t += 1)
    r.push([t, parseInt(31 + Math.random() * 7)]);
  var i = new Array();
  i.push({
    label: "Clicks per month",
    data: e,
    bars: { show: !0, barWidth: 0.2, order: 1, lineWidth: 2 },
  });
  i.push({
    label: "Referalls per month",
    data: n,
    bars: { show: !0, barWidth: 0.2, order: 2 },
  });
  i.push({
    label: "Downloads per month",
    data: r,
    bars: { show: !0, barWidth: 0.2, order: 3 },
  });
  if ($("#flot-2").length > 0) {
    var s = [],
      o = [];
    for (var t = 0; t < 14; t += 0.5) {
      s.push([t, Math.sin(t)]);
      o.push([t, Math.cos(t)]);
    }
    var u = $.plot(
      $("#flot-2"),
      [
        { data: s, label: "sin(x)" },
        { data: o, label: "cos(x)" },
      ],
      {
        series: { lines: { show: !0 }, points: { show: !0 } },
        grid: { hoverable: !0, clickable: !0 },
        yaxis: { min: -1.2, max: 1.2 },
      }
    );
  }
  if ($("#flot-5").length > 0) {
    var a = [],
      f = Math.floor(Math.random() * 4) + 2;
    for (var t = 0; t < f; t++)
      a[t] = {
        label: "Series" + (t + 1),
        data: Math.floor(Math.random() * 100) + 1,
      };
    $.plot($("#flot-5"), a, { series: { pie: { show: !0 } } });
    $.plot($("#flot-6"), a, {
      series: {
        pie: {
          show: !0,
          radius: 1,
          label: {
            show: !0,
            radius: 1,
            formatter: function (e, t) {
              return (
                '<div style="font-size:8pt;text-align:center;padding:2px;color:white;">' +
                e +
                "<br/>" +
                Math.round(t.percent) +
                "%</div>"
              );
            },
            background: { opacity: 0.8 },
          },
        },
      },
      legend: { show: !1 },
    });
    $.plot($("#flot-7"), a, {
      series: {
        pie: {
          show: !0,
          radius: 1,
          label: {
            show: !0,
            radius: 0.75,
            formatter: function (e, t) {
              return (
                '<div style="font-size:8pt;text-align:center;padding:2px;color:white;">' +
                e +
                "<br/>" +
                Math.round(t.percent) +
                "%</div>"
              );
            },
            background: { opacity: 0.5 },
          },
        },
      },
      legend: { show: !1 },
    });
    $.plot($("#flot-8"), a, {
      series: { pie: { innerRadius: 0.5, show: !0 } },
    });
  }
  if ($("#flot-4").length > 0) {
    var e = [];
    for (var t = 0; t <= 10; t += 1) e.push([t, parseInt(Math.random() * 30)]);
    var n = [];
    for (var t = 0; t <= 10; t += 1) n.push([t, parseInt(Math.random() * 30)]);
    var r = [];
    for (var t = 0; t <= 10; t += 1) r.push([t, parseInt(Math.random() * 30)]);
    var l = 0,
      c = !0,
      h = !1,
      p = !1;
    function d() {
      $.plot($("#flot-4"), [e, n, r], {
        series: {
          stack: l,
          lines: { show: h, fill: !0, steps: p },
          bars: { show: c, barWidth: 0.6 },
        },
      });
    }
    d();
    $(".stackControls input").click(function (e) {
      e.preventDefault();
      l = $(this).val() == "With stacking" ? !0 : null;
      d();
    });
    $(".graphControls input").click(function (e) {
      e.preventDefault();
      c = $(this).val().indexOf("Bars") != -1;
      h = $(this).val().indexOf("Lines") != -1;
      p = $(this).val().indexOf("steps") != -1;
      d();
    });
  }
  if ($("#flot-3").length > 0) {
    var a = [],
      v = 300;
    function m() {
      a.length > 0 && (a = a.slice(1));
      while (a.length < v) {
        var e = a.length > 0 ? a[a.length - 1] : 50,
          t = e + Math.random() * 10 - 5;
        t < 0 && (t = 0);
        t > 100 && (t = 100);
        a.push(t);
      }
      var n = [];
      for (var r = 0; r < a.length; ++r) n.push([r, a[r]]);
      return n;
    }
    var g = 30;
    $("#updateInterval")
      .val(g)
      .change(function () {
        var e = $(this).val();
        if (e && !isNaN(+e)) {
          g = +e;
          g < 1 && (g = 1);
          g > 2e3 && (g = 2e3);
          $(this).val("" + g);
        }
      });
    var y = {
      series: { shadowSize: 0 },
      yaxis: { min: 0, max: 100 },
      xaxis: { show: !1 },
    },
      u = $.plot($("#flot-3"), [m()], y);
    function b() {
      u.setData([m()]);
      u.draw();
      setTimeout(b, g);
    }
    b();
  }
  if ($("#flot-1").length > 0) {
    var w = [];
    for (var t = 0; t < Math.PI * 2; t += 0.25) w.push([t, Math.sin(t)]);
    var E = [];
    for (var t = 0; t < Math.PI * 2; t += 0.25) E.push([t, Math.cos(t)]);
    var S = [];
    for (var t = 0; t < Math.PI * 2; t += 0.1) S.push([t, Math.tan(t)]);
    $.plot(
      $("#flot-1"),
      [
        { label: "sin(x)", data: w },
        { label: "cos(x)", data: E },
        { label: "tan(x)", data: S },
      ],
      {
        series: { lines: { show: !0 }, points: { show: !0 } },
        xaxis: {
          ticks: [
            0,
            [Math.PI / 2, "π/2"],
            [Math.PI, "π"],
            [(Math.PI * 3) / 2, "3π/2"],
            [Math.PI * 2, "2π"],
          ],
        },
        yaxis: { ticks: 10, min: -2, max: 2 },
        grid: { backgroundColor: { colors: ["#fff", "#fff"] } },
      }
    );
  }
  $(".flot-line").length > 0 &&
    $(function () {
      function n() {
        e.length > 0 && (e = e.slice(1));
        while (e.length < t) {
          var n = e.length > 0 ? e[e.length - 1] : 50,
            r = n + Math.random() * 10 - 5;
          r < 0 && (r = 0);
          r > 100 && (r = 100);
          e.push(r);
        }
        var i = [];
        for (var s = 0; s < e.length; ++s) i.push([s, e[s]]);
        return i;
      }
      function o() {
        s.setData([
          {
            label: "CPU at %",
            data: n(),
            lines: { show: !0, fill: !0 },
            points: { show: !1 },
            color: "#fd6e58",
          },
        ]);
        s.draw();
        setTimeout(o, r);
      }
      var e = [],
        t = 20,
        r = 500,
        i = {
          series: { shadowSize: 0 },
          yaxis: { min: 0, max: 100 },
          xaxis: { show: !1 },
        },
        s = $.plot(
          $(".flot-line"),
          [
            {
              label: "CPU at %",
              data: n(),
              lines: { show: !1, fill: !0 },
              points: { show: !1 },
              color: "#fd6e58",
            },
          ],
          i
        );
      $(window).resize(function () {
        if ($(".flot-line").is(":visible")) {
          s.resize();
          s.setupGrid();
          s.draw();
        }
      });
      o();
    });
  if ($(".calendar").length > 0) {
    var x = new Date(),
      T = x.getDate(),
      N = x.getMonth(),
      C = x.getFullYear();
    $(".calendar").fullCalendar("addEventSource", [
      { title: "All Day Event", start: new Date(C, N, 1) },
      {
        title: "Long Event",
        start: new Date(C, N, T - 5),
        end: new Date(C, N, T - 2),
      },
      {
        id: 999,
        title: "Repeating Event",
        start: new Date(C, N, T - 3, 16, 0),
        allDay: !1,
      },
      {
        id: 999,
        title: "Repeating Event",
        start: new Date(C, N, T + 4, 16, 0),
        allDay: !1,
      },
      { title: "Meeting", start: new Date(C, N, T, 10, 30), allDay: !1 },
      {
        title: "Lunch",
        start: new Date(C, N, T, 12, 0),
        end: new Date(C, N, T, 14, 0),
        allDay: !1,
      },
      {
        title: "Birthday Party",
        start: new Date(C, N, T + 1, 19, 0),
        end: new Date(C, N, T + 1, 22, 30),
        allDay: !1,
      },
      {
        title: "Click for Google",
        start: new Date(C, N, 28),
        end: new Date(C, N, 29),
        url: "http://google.com/",
      },
    ]);
  }
  var k = {
    id: "jQuery.PageGuide",
    title: "Take a quick tour of all the possibilities",
    steps: [
      {
        target: ".ui-resizable-handle",
        content:
          "You can resize this navigation. It will also snap to the original width if you are near it!",
        direction: "right",
      },
      {
        target: ".content-remove",
        content:
          "You can remove widgets, previous/next widgets will automatically resize!",
        direction: "right",
      },
      {
        target: ".messages",
        content: "Check out this fully working chat (with automated answer)!",
        direction: "left",
      },
      {
        target: ".alpha .alpha-val",
        content:
          "You can click on this elements to get an alphabetical overview.",
        direction: "left",
      },
      {
        target: ".colo",
        content:
          "Here you can choose between 9 different colors for this theme!",
        direction: "bottom",
      },
      {
        target: ".sett",
        content: "Here you can choose between fixed and fluid layout!",
        direction: "bottom",
      },
    ],
  };
  (location.pathname == "/flat/" ||
    location.pathname == "/flat" ||
    location.pathname == "/flat/index.html") &&
    bootbox.confirm(
      "Would you like to start the page guide? It will show you functions you could miss!",
      "No",
      "Yes",
      function (e) {
        e &&
          $.pageguide(k, {
            events: {
              close: function () {
                $.pageguide("unload");
              },
            },
          }).open();
      }
    );
  $("#map1").length > 0 &&
    $("#map1").gmap3({
      map: {
        options: { center: [22.49156846196823, 89.75802349999992], zoom: 7 },
      },
    });
  $("#map4").length > 0 &&
    $("#map4").gmap3({
      map: { options: { center: [46.578498, 2.457275], zoom: 5 } },
      marker: {
        values: [
          { latLng: [48.8620722, 2.352047], data: "Paris !" },
          {
            address: "86000 Poitiers, France",
            data: "Poitiers : great city !",
          },
          {
            address: "66000 Perpignan, France",
            data: "Perpignan ! GO USAP !",
            options: {
              icon: "http://maps.google.com/mapfiles/marker_green.png",
            },
          },
        ],
        events: {
          click: function (e, t, n) {
            var r = $(this).gmap3("get"),
              i = $(this).gmap3({ get: { name: "infowindow" } });
            if (i) {
              i.open(r, e);
              i.setContent(n.data);
            } else
              $(this).gmap3({
                infowindow: { anchor: e, options: { content: n.data } },
              });
          },
        },
      },
    });
  if ($("#map2").length > 0) {
    var L = new Gmap3Menu($("#map2")),
      A,
      O,
      M;
    function _(e, t) {
      t ? (O = e) : (M = e);
      P();
    }
    function D(e) {
      var t = { name: "marker" };
      if (e && O) {
        t.tag = "from";
        $("#map2").gmap3({ clear: t });
      } else if (!e && M) {
        t.tag = "to";
        $("#map2").gmap3({ clear: t });
      }
      $("#map2").gmap3({
        marker: {
          latLng: A.latLng,
          options: {
            draggable: !0,
            icon: new google.maps.MarkerImage(
              "http://maps.gstatic.com/mapfiles/icon_green" +
              (e ? "A" : "B") +
              ".png"
            ),
          },
          tag: e ? "from" : "to",
          events: {
            dragend: function (t) {
              _(t, e);
            },
          },
          callback: function (t) {
            _(t, e);
          },
        },
      });
    }
    function P() {
      if (!O || !M) return;
      $("#map2").gmap3({
        getroute: {
          options: {
            origin: O.getPosition(),
            destination: M.getPosition(),
            travelMode: google.maps.DirectionsTravelMode.DRIVING,
          },
          callback: function (e) {
            if (!e) return;
            $("#map2").gmap3({ get: "directionrenderer" }).setDirections(e);
          },
        },
      });
    }
    L.add("Direction to here", "itemB", function () {
      L.close();
      D(!1);
    });
    L.add("Direction from here", "itemA separator", function () {
      L.close();
      D(!0);
    });
    L.add("Zoom in", "zoomIn", function () {
      var e = $("#map2").gmap3("get");
      e.setZoom(e.getZoom() + 1);
      L.close();
    });
    L.add("Zoom out", "zoomOut", function () {
      var e = $("#map2").gmap3("get");
      e.setZoom(e.getZoom() - 1);
      L.close();
    });
    L.add("Center here", "centerHere", function () {
      $("#map2").gmap3("get").setCenter(A.latLng);
      L.close();
    });
    $("#map2").gmap3({
      map: {
        options: { center: [48.85861640881589, 2.3459243774414062], zoom: 5 },
        events: {
          rightclick: function (e, t) {
            A = t;
            L.open(A);
          },
          click: function () {
            L.close();
          },
          dragstart: function () {
            L.close();
          },
          zoom_changed: function () {
            L.close();
          },
        },
      },
      directionsrenderer: {
        divId: "directions",
        options: { preserveViewport: !0, markerOptions: { visible: !1 } },
      },
    });
  }
  if ($("#map3").length > 0)
    var H = [
      [47.398349200359256, 0.791015625],
      [47.249406957888446, 1.8896484375],
      [47.517200697839414, 2.9443359375],
      [47.010225655683485, 3.2958984375],
      [46.800059446787316, 2.5927734375],
      [46.46813299215554, 1.8017578125],
      [45.98169518512228, 1.7578125],
      [46.6795944656402, 3.9111328125],
      [48.40003249610685, 1.6259765625],
      [48.719961222646276, 2.8125],
      [48.48748647988415, 3.603515625],
      [48.22467264956519, 4.21875],
      [47.754097979680026, 4.74609375],
      [48.07807894349862, 3.3837890625],
      [48.48748647988415, 1.8896484375],
      [47.45780853075031, 1.23046875],
      [46.830133640447386, 0.703125],
      [46.13417004624326, 2.8564453125],
      [46.37725420510028, 3.427734375],
      [48.37084770238363, 2.0654296875],
      [48.3416461723746, 2.4609375],
      [48.1367666796927, 2.2412109375],
      [48.54570549184746, 0.4833984375],
      [47.30903424774781, 6.2841796875],
      [45.85941212790755, 4.658203125],
      [44.276671273775186, 3.3837890625],
      [44.24519901522129, 5.185546875],
      [43.48481212891603, -0.3076171875],
      [48.1367666796927, 11.513671875],
      [49.468124067331644, 11.07421875],
      [50.90303283111257, 8.9208984375],
      [51.01375465718821, 9.66796875],
      [50.98609893339354, 10.546875],
      [51.01375465718821, 10.9423828125],
      [50.764259357116465, 11.07421875],
      [50.42951794712287, 10.37109375],
      [49.781264058178365, 9.31640625],
      [48.429200555568386, 9.755859375],
      [47.96050238891509, 10.634765625],
      [47.754097979680026, 8.2177734375],
      [48.893615361480194, 7.822265625],
      [50.819818262156545, 6.4599609375],
      [51.09662294502995, 7.119140625],
      [51.12421275782688, 7.7783203125],
      [50.65294336725708, 7.470703125],
      [50.12057809796007, 6.8994140625],
      [49.49667452747044, 6.4599609375],
      [49.866316729538674, 5.712890625],
      [50.2612538275847, 5.09765625],
      [50.064191736659104, 4.3505859375],
      [49.696061819115634, 5.3173828125],
      [49.32512199104001, 5.9326171875],
      [48.893615361480194, 6.240234375],
      [49.439556958940855, 4.833984375],
      [51.890053935216926, 5.6689453125],
      [52.05249047600099, 7.119140625],
      [52.13348804077147, 7.998046875],
      [52.16045455774706, 8.3935546875],
      [52.29504228453735, 9.0966796875],
      [52.40241887397331, 10.0634765625],
      [52.562995039558004, 11.0302734375],
      [52.562995039558004, 11.42578125],
      [52.07950600379697, 12.2607421875],
      [51.69979984974196, 13.447265625],
      [51.39920565355378, 12.83203125],
      [52.10650519075632, 10.986328125],
      [52.10650519075632, 9.580078125],
      [51.26191485308451, 12.919921875],
      [50.65294336725708, 13.4912109375],
      [50.12057809796007, 12.7880859375],
      [49.52520834197441, 12.65625],
      [49.26780455063753, 13.4033203125],
      [49.09545216253482, 14.1064453125],
      [48.25394114463431, 12.9638671875],
      [47.754097979680026, 12.0849609375],
      [47.487513008956554, 11.865234375],
      [47.05515408550348, 16.19384765625],
      [46.965259400349275, 11.57958984375],
      [47.17477833929903, 11.2939453125],
      [47.18971246448421, 10.56884765625],
      [47.040182144806664, 10.1513671875],
      [46.73986059969267, 10.26123046875],
      [46.40756396630067, 10.72265625],
      [46.58906908309182, 11.689453125],
      [47.05515408550348, 10.96435546875],
      [46.70973594407157, 11.35986328125],
      [46.55886030311719, 9.82177734375],
      [47.279229002570816, 9.140625],
      [46.6795944656402, 9.140625],
      [46.37725420510028, 9.1845703125],
      [46.13417004624326, 9.7119140625],
      [46.01222384063236, 10.8544921875],
      [45.24395342262324, 7.3388671875],
      [44.74673324024678, 7.6025390625],
    ],
      B = $("#map3").gmap3({
        map: { options: { maxZoom: 14, zoom: 5 } },
        marker: {
          values: H,
          cluster: {
            radius: 100,
            events: {
              click: function (e) {
                $("#map3").gmap3({
                  map: {
                    options: {
                      center: e.main.getPosition(),
                      zoom: e.main.map.zoom + 1,
                    },
                  },
                });
              },
            },
            0: {
              content: "<div class='cluster cluster-1'>CLUSTER_COUNT</div>",
              width: 53,
              height: 52,
            },
            20: {
              content: "<div class='cluster cluster-2'>CLUSTER_COUNT</div>",
              width: 56,
              height: 55,
            },
            50: {
              content: "<div class='cluster cluster-5'>CLUSTER_COUNT</div>",
              width: 66,
              height: 65,
            },
          },
        },
      });
});
$(window).resize(function () { });
