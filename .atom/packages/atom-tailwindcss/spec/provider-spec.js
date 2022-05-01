'use babel';

describe('atom-tailwindcss', () => {
  let editor, provider;

  function getCompletions () {
    const cursor = editor.getLastCursor();
    const bufferPosition = cursor.getBufferPosition();
    const scopeDescriptor = cursor.getScopeDescriptor();
    const line = editor.getTextInRange([[bufferPosition.row, 0], bufferPosition]);
    const prefixMatch = /(\b|['"~`!@#$%^&*(){}[\]=+,/?>])((\w+[\w-]*)|([.:;[{(< ]+))$/.exec(line);
    const prefix = prefixMatch ? prefixMatch[2] : '';
    return provider.getSuggestions({ editor, bufferPosition, scopeDescriptor, prefix });
  }

  beforeEach(() => {
    waitsForPromise(() => atom.packages.activatePackage('atom-tailwindcss'));
    waitsForPromise(() => atom.workspace.open('test.html'));

    runs(() => {
      editor = atom.workspace.getActiveTextEditor();
      provider = atom.packages.getActivePackage('atom-tailwindcss').mainModule.getProvider();
    });
  });

  it('returns no completions when current project does not have tailwind installed', () => {
    provider.isTailwindProject = false;

    editor.setText('<div class="bg-black');
    expect(getCompletions().length).toBe(0);
  });

  it('returns no completions when not at the start of the class attribute', () => {
    provider.isTailwindProject = true;
    editor.setText('');
    expect(getCompletions().length).toBe(0);
  });

  it('autcompletes html class attribute', () => {
    provider.isTailwindProject = true;

    editor.setText('<div class="bg-black');
    editor.setCursorBufferPosition([0, 19]);

    const completions = getCompletions();
    expect(completions.length).toBe(1);
    expect(completions[0].text).toContain('bg-black');
    expect(completions[0].rightLabel).toContain('background-color: #000;');
    expect(completions[0].leftLabelHTML).toContain('<div style="background-color: #000" class="tailwind__color-preview"></div>');
  });

  it('autcompletes @apply at-rule', () => {
    provider.isTailwindProject = true;

    editor.setText('@apply font-sa');
    editor.setCursorBufferPosition([0, 14]);

    expect(getCompletions().length).toBe(1);
  });

  it('autcompletes html className attribute', () => {
    provider.isTailwindProject = true;

    editor.setText('<div className="font-sa');
    editor.setCursorBufferPosition([0, 23]);

    expect(getCompletions().length).toBe(1);
  });

  it('autcompletes with starting dash', () => {
    provider.isTailwindProject = true;

    editor.setText('<div class="-');
    editor.setCursorBufferPosition([0, 14]);

    expect(getCompletions()[0].text).toBe('-m-1');
  });
});
