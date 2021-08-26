<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<meta charset="utf-8">
<title>Tree Traversals</title>
<!-- stuff for styling -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css"/>
<!-- stuff for d3 -->
<script src="${pageContext.request.contextPath}/static/js/d3.v3.5.5.min.js" charset="utf-8"></script>
<!-- data stuff -->
<script src="${pageContext.request.contextPath}/static/js/data.js"></script>

<body>
  <div id="content"></div>
</body>
<script src="d3js.org/d3.v3.min.js"></script>
<script>
var chart = {
    width: 960,
    height: 500,
    margins: { x: 300, y: 50 }
};

var bar = {
    width: 55,
    height: 65,
    spacing: 20
};

var animation = {
    duration: 400,
    pauseDuration: 400
};

var data = [
    { value: 4, range: 1, angle: 0, color: '#377eb8', width: 1, label: "node 1" },
    { value: 4, range: 1, angle: 0, color: '#4daf4a', width: 1, label: "node 2" },
    { value: 4, range: 1, angle: 0, color: '#ff7f00', width: 1, label: "node 3" },
    { value: 4, range: 1, angle: 0, color: '#e41a1c', width: 1, label: "node 4" },
    { value: 4, range: 1, angle: 0, color: '#984ea3', width: 1, label: "node 5" },
    { value: 4, range: 1, angle: 0, color: '#f781bf', width: 1, label: "node 6" }
];

function render(selection) {
    selection
    .attr('width', function (d, i) { return d.width * bar.width; })
    .attr('height', function (d, i) { return d.range * bar.height; })
    .attr('fill', function (d, i) { return d.color; })
    .attr('transform', function (d, i) { return 'translate(' + [chart.margins.x + i * (bar.width + bar.spacing), -chart.margins.y + chart.height - d.value * bar.height] + ') ' + 'rotate(' + [(d.angle)] + ')' + 'translate(' + [-bar.width / 2, -d.range / 2] + ')'; })
}

function addText(selection){
  selection
  .text(function(d,i){
    return d.label;
  })
  .attr('font-size',8)
  .attr("dx",function(d,i){return d.width * bar.width-0.75*bar.width;})
  .attr("dy",function(d,i){return d.range * bar.height+0.10*bar.height;})
  .attr('transform', function (d, i) { return 'translate(' + [chart.margins.x + i * (bar.width + bar.spacing), -chart.margins.y + chart.height - d.value * bar.height] + ') ' + 'rotate(' + [(d.angle)] + ')' + 'translate(' + [-bar.width / 2, -d.range / 2] + ')'; });
}

window.onload = function () {
    // make the svg
    var svg = d3.select('#content').append('svg');
    svg.attr('width', chart.width).attr('height', chart.height).style('background', 'white');
    // initialize rectangles
    var rects = svg.selectAll('rect').data(data).enter().append('rect');
    var texts = svg.selectAll('text').data(data).enter().append('text');
    render(rects);
    addText(texts);
    // start timer
    i=0;
    j=1;
    setInterval(function () {
        data = swap(i,j,data);
        // apply the data to the rectangles
        var rects = svg.selectAll('rect').data(data);
        var texts = svg.selectAll('text').data(data)
        // create rectangles that were added
        render(rects.enter().append('rect'));
        addText(texts.enter().append('text'));
        // update rectangles that changed
        render(rects.transition().duration(animation.duration));
        // update text boxes that changed
        addText(texts.transition().duration(animation.duration))
        // remove deleted rectangles
        rects.exit().remove();
        // remove deleted text boxes
        texts.exit().remove();
        i=(i+1)%data.length;
        j=(j+1)%data.length;
    }, animation.duration + animation.pauseDuration);
};

function swap(i, j, array) {
  temp = array[i]
  array[i] = array[j]
  array[j] = temp
  return array;
}

</script>

<script src="${pageContext.request.contextPath}/static/js/treeTraversal.js"></script>
<%@ include file="footer.jsp" %>