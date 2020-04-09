# utilityKeyBindfunctions-Teverse
Utility functions to help assist in binding keys to certain events and then do actions based on that. This is meant to work in a Teverse enviorment.

# Documentation
<h3>bindKeyToPressed</h3>
<table>
	<tr>
		<th><strong>Parameter</strong></th]>
		<th><strong>Type</strong></th]>
		<th><strong>Description</strong></th]>
	</tr>
	<tr>
		<th>keyName</th>
		<th>string</th>
		<th>The name of the key to be bonded.</th]>
	</tr>
	<tr>
		<th>functionOnPressed</th]>
		<th>function</th>
		<th>The function passed that will run whenever pressed.</th]>
	</tr>
	<tr>
		<th>functionOnRelease</th]>
		<th>function</th>
		<th><i>Optional argument.</i> Function passed will run whenever the key is let go. The listener will be disconnected first before this is ran.</th]>
	</tr>
</table>

<h3>bindKeyToStepped</h3>
<table>
	<tr>
		<th><strong>Parameter</strong></th]>
		<th><strong>Type</strong></th]>
		<th><strong>Description</strong></th]>
	</tr>
	<tr>
		<th>keyName</th]>
		<th>string</th>
		<th>The name of the key to be bonded.</th]>
	</tr>
	<tr>
		<th>functionOnPressed</th]>
		<th>function</th>
		<th>The function passed that will run whenever pressed and repeatedly until the key is let go.</th]>
	</tr>
	<tr>
		<th>functionOnRelease</th]>
		<th>function</th>
		<th><i>Optional argument.</i> Function passed will run whenever the key is let go. The listener will be disconnected first before this is ran.</th]>
	</tr>
</table>
