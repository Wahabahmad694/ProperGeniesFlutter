import 'package:ProperGenies/data/base_vm.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutVm extends BaseVm {
  late GoogleMapController _mapController;
  Set<Marker> _markers = {};
  final LatLng _initialPosition =
      const LatLng(51.518261, -0.142000);

  // Getters
  LatLng get initialPosition => _initialPosition;

  Set<Marker> get markers => _markers;

  // Map Controller
  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    notifyListeners();
  }

  AboutVm() {
    _addInitialMarkers();
  }

  void _addInitialMarkers() {
    _markers.addAll([
      Marker(
        markerId: MarkerId("1"),
        position: _initialPosition, // Example position
        infoWindow: InfoWindow(title: "Proper genies"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    ]);
    notifyListeners();
  }

  // Add Marker
  void addMarker(LatLng position, String title) {
    final marker = Marker(
      markerId: MarkerId(position.toString()),
      position: position,
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title: title),
    );
    _markers.add(marker);
    notifyListeners();
  }

  // Update Camera Position
  void moveCamera(LatLng position) {
    _mapController.animateCamera(CameraUpdate.newLatLng(position));
  }

  Future<void> openSocial(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  void launchDialer(String phoneNumber) async {
    final sanitizedNumber = phoneNumber.replaceAll(' ', '');

    final Uri url = Uri(scheme: 'tel', path: sanitizedNumber);
    await launchUrl(url);
  }

  // void launcherDirectCall(String phoneNumber) async {
  //   final sanitizedNumber = phoneNumber.replaceAll(' ', '');
  //   await FlutterPhoneDirectCaller.callNumber(sanitizedNumber);
  // }

  void launchEmail(String email, String subject) async {
    final Uri url = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=$subject',
    );
    await launchUrl(url);
  }

  // Helper function to encode query parameters
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
