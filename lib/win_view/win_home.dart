import 'package:fluent_ui/fluent_ui.dart';

class WinHome extends StatefulWidget {
  const WinHome({super.key});

  @override
  State<WinHome> createState() => _WindowsViewState();
}

class _WindowsViewState extends State<WinHome> {
  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        leading: const FlutterLogo(),
        title: const DragToMoveArea(child: Align(alignment: AlignmentDirectional.centerStart, child: Text('TempBox'))),
        actions: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Tooltip(
            message: 'Refresh inbox',
            child: IconButton(
              icon: const Icon(CupertinoIcons.refresh_thick, size: 20),
              onPressed: dataState.selectedAddress == null || dataState.selectedAddress?.archived == true
                  ? null
                  : () => _refreshInbox(dataBlocContext, dataState.selectedAddress),
            ),
          ),
          const SizedBox(width: 10),
          Tooltip(
            message: 'Address information',
            child: IconButton(
              icon: const Icon(CupertinoIcons.info_circle, size: 20),
              onPressed: dataState.selectedAddress == null ? null : () => _showAddressInfo(dataBlocContext, dataState.selectedAddress),
            ),
          ),
          const SizedBox(width: 10),
          Tooltip(
            message: dataState.selectedAddress?.archived == true ? 'Unarchive Address' : 'Archive Address',
            child: IconButton(
              icon: Icon(
                dataState.selectedAddress?.archived == true ? CupertinoIcons.archivebox_fill : CupertinoIcons.archivebox,
                size: 20,
              ),
              onPressed: dataState.selectedAddress == null ? null : () => _toggleArchiveAddress(dataBlocContext, dataState.selectedAddress),
            ),
          ),
          const SizedBox(width: 10),
          Tooltip(
            message: 'Delete address',
            child: IconButton(
              icon: const Icon(CupertinoIcons.trash, size: 20),
              onPressed: dataState.selectedAddress == null ? null : () => _deleteAddress(dataBlocContext, dataState.selectedAddress),
            ),
          ),
          const SizedBox(width: 10),
          const Divider(direction: Axis.vertical),
          const SizedBox(width: 10),
          Tooltip(
            message: dataState.selectedMessage?.seen ?? false ? 'Mark message as unread' : 'Mark message as read',
            child: IconButton(
              icon: Icon(dataState.selectedMessage?.seen ?? false ? CupertinoIcons.envelope_badge : CupertinoIcons.envelope_open, size: 20),
              onPressed: dataState.selectedMessage == null ? null : () => _toggleMessageSeenStatus(dataBlocContext, dataState),
            ),
          ),
          const SizedBox(width: 10),
          Tooltip(
            message: 'Share message',
            child: IconButton(
              icon: const Icon(FluentIcons.share, size: 20),
              onPressed: dataState.selectedMessage == null ? null : () {},
            ),
          ),
          const SizedBox(width: 10),
          Tooltip(
            message: 'Delete message',
            child: IconButton(
              icon: const Icon(CupertinoIcons.trash, size: 20),
              onPressed: dataState.selectedMessage == null ? null : () => _deleteMessage(dataBlocContext, dataState),
            ),
          ),
          const SizedBox(width: 10),
          const Divider(direction: Axis.vertical),
          const SizedBox(width: 10),
          Tooltip(
            message: 'Import addresses',
            child: IconButton(
              icon: const Icon(FluentIcons.import, size: 20),
              onPressed: () => _importAddresses(context, dataBlocContext),
            ),
          ),
          if (dataState.addressList.isNotEmpty) const SizedBox(width: 10),
          if (dataState.addressList.isNotEmpty)
            Tooltip(
              message: 'Export addresses',
              child: IconButton(
                icon: const Icon(FluentIcons.export, size: 20),
                onPressed: () => _exportAddresses(context, dataBlocContext),
              ),
            ),
          const SizedBox(width: 10),
          const Divider(direction: Axis.vertical),
          const SizedBox(width: 10),
          const WindowButtons(),
        ]),
      ),
      pane: NavigationPane(
        header: Card(
          margin: const EdgeInsets.only(right: 15, left: 8, bottom: 15),
          padding: EdgeInsets.zero,
          child: ListTile(
            title: Text('New Address', style: FluentTheme.of(context).typography.body),
            trailing: const Icon(CupertinoIcons.add_circled_solid),
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (_) => BlocProvider.value(
                  value: BlocProvider.of<DataBloc>(dataBlocContext),
                  child: const WinuiAddAddress(),
                ),
              );
            },
          ),
        ),
        onItemPressed: (index) {
          if (dataState.addressList.isEmpty) {
            return;
          }
          if (index < active.length) {
            BlocProvider.of<DataBloc>(dataBlocContext).add(SelectAddressEvent(active[index]));
            return;
          }
          if (index >= active.length) {
            BlocProvider.of<DataBloc>(dataBlocContext).add(SelectAddressEvent(archived[index - active.length]));
            return;
          }
        },
        size: NavigationPaneSize(openWidth: MediaQuery.of(context).size.width / 5, openMinWidth: 250, openMaxWidth: 250),
        items: dataState.addressList.isEmpty
            ? []
            : [
                PaneItemHeader(header: const Text('Active')),
                ...active.map((a) => PaneItem(
                      key: Key(a.authenticatedUser.account.id),
                      icon: const Icon(CupertinoIcons.tray),
                      title: Text(UiService.getAccountName(a)),
                      body: const SizedBox.shrink(),
                    )),
                PaneItemHeader(header: const Text('Archived')),
                ...archived.map((a) => PaneItem(
                      key: Key(a.authenticatedUser.account.id),
                      icon: const Icon(CupertinoIcons.tray),
                      title: Text(UiService.getAccountName(a)),
                      body: const SizedBox.shrink(),
                    )),
              ],
        displayMode: PaneDisplayMode.open,
        toggleable: true,
        selected: selectedIndex,
        footerItems: [
          PaneItemSeparator(),
          PaneItemHeader(
            header: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: RichText(
                text: TextSpan(
                  text: "Powered by ",
                  style: FluentTheme.of(context).typography.body,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'mail.tm',
                      style: TextStyle(color: FluentTheme.of(context).accentColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          bool? choice = await AlertService.getConformation(
                            context: context,
                            title: 'Do you want to continue?',
                            content: 'This will open mail.tm website.',
                          );
                          if (choice == true) {
                            await launchUrl(Uri.parse('https://mail.tm'));
                          }
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
          PaneItemSeparator(thickness: 0),
        ],
      ),
      paneBodyBuilder: (item, child) {
        final name = item?.key is ValueKey ? (item!.key as ValueKey).value : null;
        return FocusTraversalGroup(key: ValueKey('body$name'), child: WinuiSelectedAddressView());
      },
      // onDisplayModeChanged: (value) {},
      // onOpenSearch: () {},
    );
  }
}
