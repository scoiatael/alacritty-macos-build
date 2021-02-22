install: target/Alacritty.app
	test -d ~/Applications/Alacritty.app && rm -r ~/Applications/Alacritty.app
	mv target/Alacritty.app ~/Applications

.PHONY: install

target/appify:
	cd appify && go build -o ../target/appify

alacritty/target/release/alacritty:
	cd alacritty && cargo build --release

target/Alacritty.app: alacritty/target/release/alacritty target/appify target/alacritty.png
	cd target && ./appify -name "Alacritty" -icon ./alacritty.png ../alacritty/target/release/alacritty

target/alacritty.png:
	wget https://raw.githubusercontent.com/alacritty/alacritty/master/extra/logo/compat/alacritty-term%2Bscanlines.png -O target/alacritty.png
