import { FirstPwaPage } from './app.po';

describe('first-pwa App', () => {
  let page: FirstPwaPage;

  beforeEach(() => {
    page = new FirstPwaPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!!');
  });
});
