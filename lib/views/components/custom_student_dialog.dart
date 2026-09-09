import 'package:flutter/material.dart';
import '../../models/student_persona.dart';
import '../../theme/app_theme.dart';

/// Modal dialog allowing evaluators and staff to input any custom student persona.
class CustomStudentDialog extends StatefulWidget {
  const CustomStudentDialog({super.key});

  @override
  State<CustomStudentDialog> createState() => _CustomStudentDialogState();
}

class _CustomStudentDialogState extends State<CustomStudentDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'Jordan');
  final _challengeController =
      TextEditingController(text: 'Long Division & Remainders');
  final _interestController =
      TextEditingController(text: 'Minecraft & Redstone Building');
  int _selectedGrade = 4;

  @override
  void dispose() {
    _nameController.dispose();
    _challengeController.dispose();
    _interestController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final customPersona = StudentPersona(
        id: 'custom_${DateTime.now().millisecondsSinceEpoch}',
        name: _nameController.text.trim(),
        grade: _selectedGrade,
        learningChallenge: _challengeController.text.trim(),
        interest: _interestController.text.trim(),
        avatarEmoji: '⭐',
        accentColor: AppTheme.amber,
        isCustom: true,
      );
      Navigator.of(context).pop(customPersona);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppTheme.amberLight,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.person_add_alt_1_outlined,
                            color: AppTheme.amber,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Create Custom Student',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              'Test the Copilot with any grade level and interest',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppTheme.textMuted,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 20),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(color: AppTheme.border, height: 1),
                const SizedBox(height: 20),

                // Name & Grade Row
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Student First Name',
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.textPrimary,
                                ),
                          ),
                          const SizedBox(height: 6),
                          TextFormField(
                            controller: _nameController,
                            decoration: _inputDecoration('e.g. Liam, Sophia'),
                            validator: (val) =>
                                (val == null || val.trim().isEmpty)
                                    ? 'Enter a student name'
                                    : null,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Grade Level',
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.textPrimary,
                                ),
                          ),
                          const SizedBox(height: 6),
                          DropdownButtonFormField<int>(
                            initialValue: _selectedGrade,
                            decoration: _inputDecoration(''),
                            items: const [
                              DropdownMenuItem(value: 2, child: Text('2nd Grade')),
                              DropdownMenuItem(value: 3, child: Text('3rd Grade')),
                              DropdownMenuItem(value: 4, child: Text('4th Grade')),
                              DropdownMenuItem(value: 5, child: Text('5th Grade')),
                              DropdownMenuItem(value: 6, child: Text('6th Grade')),
                            ],
                            onChanged: (val) {
                              if (val != null) {
                                setState(() => _selectedGrade = val);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                // Learning Challenge
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Specific Learning Challenge / Obstacle',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textPrimary,
                          ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _challengeController,
                      decoration: _inputDecoration(
                        'e.g. Two-digit subtraction, Phonics blends, Word problems',
                      ),
                      validator: (val) => (val == null || val.trim().isEmpty)
                          ? 'Enter an academic challenge'
                          : null,
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                // Personal Interest / Hobby
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Personal Passion / Hobby',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textPrimary,
                          ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _interestController,
                      decoration: _inputDecoration(
                        'e.g. Basketball, Minecraft, Gymnastics, Cooking, LEGO',
                      ),
                      validator: (val) => (val == null || val.trim().isEmpty)
                          ? 'Enter an interest or hobby'
                          : null,
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 12),
                    FilledButton.icon(
                      onPressed: _submit,
                      style: FilledButton.styleFrom(
                        backgroundColor: AppTheme.skyBlue,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(Icons.auto_awesome, size: 16),
                      label: const Text('Add & Select Student'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 13, color: AppTheme.textMuted),
      filled: true,
      fillColor: AppTheme.background,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppTheme.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppTheme.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppTheme.skyBlue, width: 1.5),
      ),
    );
  }
}
