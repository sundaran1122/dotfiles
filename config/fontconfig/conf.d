<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
<fontconfig>
	<!--
	make mononoki more closer together
	-->
	<match target="font">
		<test name="family" qual="any">
			<string>mononoki</string>
		</test>
		<edit name="matrix" mode="assign">
			<times>
				<name>matrix</name>
				<matrix>
					<double>0.95</double><double>0</double>
					<double>0</double><double>1</double>
				</matrix>
			</times>
		</edit>
	</match>

</fontconfig>
