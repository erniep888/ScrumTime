
/*
 * GET home page.
 */

exports.index = function(req, res){
  res.render('story/index.html', { title: 'ScrumTime' });
};