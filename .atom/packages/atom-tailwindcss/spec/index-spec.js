'use babel';

const path = require('path');

let module;

function setPathAndActivate (folder) {
  atom.project.setPaths([path.join(__dirname, 'fixtures', folder)]);
  waitsForPromise(() => atom.packages.activatePackage('atom-tailwindcss'));
  runs(() => {
    module = atom.packages.getActivePackage('atom-tailwindcss').mainModule;
  });
}

describe('project-tailwind', () => {
  it('detects tailwind project', function () {
    setPathAndActivate('project-tailwind');
    waitsForPromise(() => module.isTailwindListedAsDependency());
    runs(() => {
      expect(module.getProvider().isTailwindProject).toBe(true);
    });
  });
});

describe('project-html', () => {
  it('does not detect tailwind project', function () {
    setPathAndActivate('project-html');
    waitsForPromise(() => module.isTailwindListedAsDependency());
    runs(() => {
      expect(module.getProvider().isTailwindProject).toBe(false);
    });
  });

  it('does not detect tailwind project but activates anyway', function () {
    atom.config.set('atom-tailwindcss.isDisabledIfNotInPackageJson', false);
    setPathAndActivate('project-html');
    runs(() => {
      expect(module.getProvider().isTailwindProject).toBe(true);
    });
  });
});
