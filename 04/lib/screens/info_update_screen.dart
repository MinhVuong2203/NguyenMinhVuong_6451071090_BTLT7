import 'package:flutter/material.dart';
import 'package:nguyenminhvuong_api/controller/info_controller.dart';
import 'package:nguyenminhvuong_api/data/models/info.dart';

class InfoUpdateScreen extends StatefulWidget {
  const InfoUpdateScreen({super.key});

  @override
  State<InfoUpdateScreen> createState() => _InfoUpdateScreenState();
}

class _InfoUpdateScreenState extends State<InfoUpdateScreen> {
  final InfoController _controller = InfoController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _avatarController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  static const String _infoId = '1';
  Info? _info;
  bool _isLoading = true;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _loadInfo();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _avatarController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _loadInfo() async {
    setState(() => _isLoading = true);

    try {
      final info = await _controller.fetchInfo(_infoId);
      if (!mounted) return;
      _bindInfoToForm(info);
      setState(() {
        _info = info;
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading info: $e')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _bindInfoToForm(Info info) {
    _nameController.text = info.name;
    _avatarController.text = info.avatar;
    _emailController.text = info.email;
  }

  Future<void> _updateInfo() async {
    if (!_formKey.currentState!.validate() || _info == null) {
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      final payload = Info(
        id: _info!.id,
        createdAt: _info!.createdAt,
        name: _nameController.text.trim(),
        avatar: _avatarController.text.trim(),
        email: _emailController.text.trim(),
      );

      final updatedInfo = await _controller.updateInfo(payload);
      if (!mounted) return;

      _bindInfoToForm(updatedInfo);
      setState(() => _info = updatedInfo);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Update info successfully')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error updating info: $e')));
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final avatarUrl = _avatarController.text.trim();

    return Scaffold(
      appBar: AppBar(title: const Text('Update Info (PUT API)')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: ClipOval(
                        child: Container(
                          width: 180,
                          height: 180,
                          color: Colors.grey.shade200,
                          child: avatarUrl.isEmpty
                              ? const Center(
                                  child: Icon(Icons.person, size: 56),
                                )
                              : Image.network(
                                  avatarUrl,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Center(
                                      child: Icon(Icons.broken_image, size: 56),
                                    );
                                  },
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _avatarController,
                      decoration: const InputDecoration(
                        labelText: 'Avatar URL',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (_) => setState(() {}),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Avatar URL is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _isSubmitting ? null : _updateInfo,
                      child: _isSubmitting
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Update Info'),
                    ),
                    const SizedBox(height: 20),
                    if (_info != null) ...[
                      const Text(
                        'Updated data:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text('id: ${_info!.id}'),
                      Text('createdAt: ${_info!.createdAt}'),
                      Text('name: ${_info!.name}'),
                      Text('avatar: ${_info!.avatar}'),
                      Text('email: ${_info!.email}'),
                    ],
                  ],
                ),
              ),
            ),
    );
  }
}
