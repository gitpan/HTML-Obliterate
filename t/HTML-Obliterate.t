use Test::More tests => 14;
BEGIN { use_ok('HTML::Obliterate') };

my $str = q{<p>hello world</p>};
my $arr = [$str, "howdy", q{<br /><img src="" />}];

ok(HTML::Obliterate::remove_html($str) eq 'hello world', 'remove_html str');

my $new = HTML::Obliterate::remove_html($arr);

ok($new->[0] eq 'hello world', 'remove_html arr chg 1');
ok($new->[1] eq 'howdy', 'remove_html arr chg 2');
ok($new->[2] eq '', 'remove_html str arr chg 3');
ok($arr->[0] ne 'hello world', 'remove_html arr no chg 1');
ok($arr->[1] eq 'howdy', 'remove_html arr no chg 2');
ok($arr->[2] ne '', 'remove_html str arr no chg 3');

HTML::Obliterate::remove_html($arr);
ok($arr->[0] eq 'hello world', 'remove_html arr void chg');
ok($arr->[1] eq 'howdy', 'remove_html arr void chg 2');
ok($arr->[2] eq '', 'remove_html str arr void chg 3');


ok(HTML::Obliterate::extirpate_html($str) eq 'hello world', 'alias test');

ok(HTML::Obliterate::remove_html_from_string(qq{<p>hello\nworld</p><img class="css" src="bowza">}) eq "hello\nworld", 'multi line string');
ok(HTML::Obliterate::remove_html_from_string(qq{<p\nclass="foo">hello\nworld</p><img \nclass="css" src="bowza">}) eq "hello\nworld", 'multi line tag');